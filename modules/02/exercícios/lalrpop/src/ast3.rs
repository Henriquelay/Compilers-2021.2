use std::fmt::{Debug, Error, Formatter};

pub enum Exp {
    Conditional(u8),
}

impl Debug for Exp {
    fn fmt(&self, fmt: &mut Formatter) -> Result<(), Error> {
        use self::Exp::*;
        match self {
            Conditional(u) => write!(fmt, "{:?}", u),
        }
    }
}

pub enum StatementAST {
    Other
    If(Exp, Statement)
    If(Exp, Statement, Statement)
}

impl Debug for StatementAST {
    fn fmt(&self, fmt: &mut Formatter) -> Result<(), Error> {
        use self::StatementAST::*;
        match self {
            Other => write!(fmt, "other"),
            If(t) => write!(fmt, "if {:?}", t),
        }
    }
}
