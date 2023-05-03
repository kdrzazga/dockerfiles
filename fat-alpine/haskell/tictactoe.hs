-- | A piece is what a player places in a cell
data Piece = Naught | Cross                   
   deriving (Eq, Show, Read)
 
-- | Converts a piece into the board representation     
showPiece :: Piece -> Char                              
showPiece Naught = 'o'                                  
showPiece Cross  = 'x'                                  
                                                        
-- | Converts the board representation back into a piece
readPiece :: Char -> Piece                              
readPiece 'o' = Naught                                  
readPiece 'x' = Cross                                   

--| quickCheck (readPiece (showPiece Naught) == Naught) 
--| quickCheck (readPiece (showPiece Cross) == Cross) 
-- | A cell is empty or it contains a piece
type Cell = Maybe Piece                    

-- | Shows the value of a cell        
showCell :: Cell -> Char              
showCell Nothing  = '.'               
showCell (Just p) = showPiece p       
                                      
-- | Reads a board cell and transforms
readCell :: Char -> Cell              
readCell '.' = Nothing                
readCell p   = Just $ readPiece p 

--| quickCheck (readCell (showCell Nothing) == Nothing)            
--| quickCheck (readCell (showCell (Just Cross)) == (Just Cross))  
--| quickCheck (readCell (showCell (Just Naught)) == (Just Naught))

-- | A field is a 3x3 array of cells
type Field = [[Cell]]               

-- | Shows a field of cells        
showField :: Field -> [String]     
showField = map showCellRow        
   where showCellRow = map showCell
                                   
-- | Reads a field                 
readField :: [String] -> Field     
readField = map readCellRow        
   where readCellRow = map readCell
   
initialField = ["..." 
               ,"..." 
               ,"..."]

quickCheck (showField (readField initialField) == initialField)
