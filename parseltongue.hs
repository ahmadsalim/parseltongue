import System.Environment
import Data.Char
import Data.Array
import qualified Data.Sequence as S

data ByteCode =
   New
 | Incr Int
 | Decr Int
 | IfNZero Int Int
 | Print Int
 | Get Int
 deriving (Show, Eq)

main = getArgs >>= interpret

interpret [code] = run (S.empty) 0 $ arrayFromList . translate . parse $ code

interpret _      = putStrLn "Usage: <program> <codestring>"

parse ('S':rest) = incr (parse rest)
parse ('Z':rest) = 0:(parse rest)
parse (_:rest)   = parse rest
parse []         = []

incr (h:t) = (h+1):t
incr []    = error "Missing Z value to increment"

translate (0:rest)         = New:(translate rest)
translate (1:var:rest)     = (Incr var):(translate rest)
translate (2:var:rest)     = (Decr var):(translate rest)
translate (3:var:pos:rest) = (IfNZero var pos):(translate rest)
translate (4:var:rest)     = (Print var):(translate rest)
translate (5:var:rest)     = (Get var):(translate rest)
translate []               = []
translate _                = error "Invalid byte code"

arrayFromList lst = listArray (0, length lst - 1) lst

run env ix bytecode
  | ix > upper = return ()
  | otherwise  = runInstr env ix bytecode (bytecode ! ix)
  where (lower, upper) = bounds bytecode
        runInstr env ix bytecode New        =
          run (env S.|> 0) (ix + 1) bytecode
        runInstr env ix bytecode (Incr var) =
          run (S.update var (S.index env var + 1) env) (ix + 1) bytecode
        runInstr env ix bytecode (Decr var) =
          run (S.update var (S.index env var - 1) env) (ix + 1) bytecode
        runInstr env ix bytecode (IfNZero var pos)
          | (S.index env var) == 0 = run env (ix + 1) bytecode
          | otherwise              = run env pos      bytecode
        runInstr env ix bytecode (Print var) = do
          putChar . chr $ S.index env var
          run env (ix + 1) bytecode
        runInstr env ix bytecode (Get var) = do
          char <- getChar
          run (S.update var (ord char) env) (ix + 1) bytecode
