#![allow(unused)]
#[macro_use]
extern crate lalrpop_util;

lalrpop_mod!(ex1); // synthesized by LALRPOP

#[test]
fn ex1() {
    assert!(ex1::TermParser::new().parse("22").is_ok());
    assert!(ex1::TermParser::new().parse("(22)").is_ok());
    assert!(ex1::TermParser::new().parse("((((22))))").is_ok());
    assert!(ex1::TermParser::new().parse("((22)").is_err());
}

lalrpop_mod!(ex2);

#[test]
fn ex2() {
    assert!(ex2::ExprParser::new().parse("22").is_ok());
    assert!(ex2::ExprParser::new().parse("(22)").is_ok());
    assert!(ex2::ExprParser::new().parse("((((22))))").is_ok());
    assert!(ex2::ExprParser::new().parse("((22)").is_err());

    assert!(ex2::ExprParser::new().parse("22 - 22").is_ok());
    assert!(ex2::ExprParser::new().parse("(22) + 22").is_ok());
    assert!(ex2::ExprParser::new().parse("(22 - 2) + 22").is_ok());
    assert!(ex2::ExprParser::new().parse("((((22) - 2 ) * 0))").is_ok());
    assert!(ex2::ExprParser::new().parse("(22)(22)").is_err());
    assert!(ex2::ExprParser::new().parse("(22)/(22)").is_ok());
    assert!(ex2::ExprParser::new().parse("()").is_err());
    assert!(ex2::ExprParser::new().parse("((2)))").is_err());
}

lalrpop_mod!(pub ex4);
pub mod ast4;

#[test]
fn ex4() {
    assert_eq!(
        &format!(
            "{:?}",
            ex4::ExprParser::new().parse("22 * 44 + 66").unwrap()
        ),
        "((22 * 44) + 66)"
    );
    assert_eq!(
        &format!(
            "{:?}",
            ex4::ExprParser::new().parse("22 + 44 * 66").unwrap()
        ),
        "(22 + (44 * 66))"
    );
    assert_eq!(
        &format!(
            "{:?}",
            ex4::ExprParser::new().parse("22 * 44 / 66").unwrap()
        ),
        "((22 * 44) / 66)"
    );
    assert!(ex4::ExprParser::new().parse("22 ** 44 + 66").is_err());
}

#[cfg(not(test))]
fn main() {}
