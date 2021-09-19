import System.Random (randomRIO)

main :: IO ()
main = do
    putStrLn "--Adivina la combinación--\n1. Juego fácil\n2. Juego intermedio\n3. Juego difícil\nElige una opción para iniciar el juego: "
    opcion <- getLine 
    let opcionInt = (read opcion :: Int)
    let lengthArreglo = tamArreglo opcionInt
    let numeroIntentos = numIntentos opcionInt
    ls <- randomList lengthArreglo
    print ls
    usuario <- arregloUsuario lengthArreglo
    
    let pos = 0
    let numeroPosicion = ls !! pos
    let condicion = evaluarLista pos numeroPosicion usuario
    print condicion
    evaluacionRetroalimentacion condicion


    if igualLista ls usuario
        then putStrLn "Si"
        else putStrLn "No"
    
{-validacionRango :: Int -> Int
validacionRango x = 
    if (x >= 1 ) && (x <= 3) 
        then x
        else mensajeInicio x

mensajeInicio :: Int -> Int
mensajeInicio = 
    putStrLn "--Adivina la combinación--\n1. Juego fácil\n2.Juego intermedio\n3. Juego difícil\n"
    putStr "Elige una opción para iniciar el juego: "
    let opcion = getLine
        x = (read opcion :: Int)
        validacionRango x-}

randomList :: Int -> IO[Int]
randomList 0 = return []
randomList n = do
    r  <- randomRIO (0, numMax n)
    rs <- randomList (n-1)
    return (r:rs)

arregloUsuario :: Int -> IO[Int]
arregloUsuario 0 = return []
arregloUsuario n = do
    putStrLn "Ingrese un número: "
    r  <- getLine
    let opcionInt = (read r :: Int)
    rs <- arregloUsuario (n-1)
    return (opcionInt:rs)

tamArreglo :: Int -> Int
tamArreglo tam
    | tam == 1 =  4
    | tam == 2 =  5
    | otherwise =  6

numMax :: Int -> Int
numMax tam
    | tam == 4 =  7
    | tam == 5 =  8
    | tam == 6 =  9
    | otherwise = 7

numIntentos :: Int -> Int 
numIntentos numeroIntentos
    | numeroIntentos == 1 = 10
    | numeroIntentos == 2 =  15
    | otherwise =  20

igualLista:: Eq a => [a]->[a]->Bool
igualLista l1 l2 = l1 == l2

{--evaluarLista :: Int -> Int -> Int ->  IO[Int] ->  IO[Char]
evaluarLista n pos numRan listaUsuario = do
    if n == 0 then
        return listaRetroalimentacion
    else if numRan == listaUsuario !! pos then do
        listaRetroalimentacion <- '+'
        lift exit
    else if numRan == listaRan !! pos then do
        listaRetroalimentacion <- '-'
        lift exit
    else listaRetroalimentacion <- 'X'
    n <- n +1
    return evaluarLista (n-1) pos listaRan listaUsuario--}

evaluarLista :: Int -> Int -> [Int] ->  Int
evaluarLista pos numRan listaUsuario = do
    if numRan `elem` listaUsuario then
        if listaUsuario !! pos /= numRan then
            2
        else 1
    else  0

evaluacionRetroalimentacion :: Int -> IO()
evaluacionRetroalimentacion condicion
    | condicion == 1 = putStrLn "Es igual"
    | condicion == 2 = putStrLn "Es igual pero en otro lado"
    | condicion == 0 = putStrLn "No es igual"
    | otherwise = putStrLn "No agarro ningun numero"
