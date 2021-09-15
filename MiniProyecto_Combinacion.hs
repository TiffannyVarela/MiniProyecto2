main :: IO ()
main = do
    putStr "--Adivina la combinación--\n1. Juego fácil\n2. Juego intermedio\n3. Juego difícil\nElige una opción para iniciar el juego: "
    opcion <- getLine 
    let x = (read opcion :: Int)
    print (validacionRango x)

validacionRango :: Int -> Int
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
        validacionRango x