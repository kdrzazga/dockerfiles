module HelloWorldProgram where

import Data.List
import System.IO

--compile with: ghc --make HelloWorldProgram in system console (outside Haskell GHCi)

main = do
    putStrLn "What's your name"

    name <- getLine
    putStrLn ("Hello " ++ name)
	