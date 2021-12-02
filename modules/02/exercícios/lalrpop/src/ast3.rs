use std::fmt::{Debug, Error, Formatter};

pub enum Reserved {
    OTHER
}

impl Debug for Reserved {
    fn fmt(&self, fmt: &mut Formatter) -> Result<(), Error> {
        match self {
            Reserved::OTHER => write!(fmt, "Reserved::OTHER"),
        };
        Ok(())
    }
}

pub struct ID(pub String);
impl Debug for ID {
    fn fmt(&self, fmt: &mut Formatter) -> Result<(), Error> {
        match self {
            ID(n) => write!(fmt, "Identifier({:?})", n),
        };
        Ok(())
    }
}


pub enum IdentifierOrReserved {
    Identifier(ID),
    IsReserved(Reserved),
}

impl Debug for IdentifierOrReserved {
    fn fmt(&self, fmt: &mut Formatter) -> Result<(), Error> {
        match self {
            self::IdentifierOrReserved::Identifier(n) => write!(fmt, "ID_OR_R({:?})", n),
            self::IdentifierOrReserved::IsReserved(n) => write!(fmt, "ID_OR_R({:?})", n),
        };
        Ok(())
    }
}
