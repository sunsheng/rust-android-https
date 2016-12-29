extern crate hyper;

use std::io::prelude::*;

fn main() {
    let client = hyper::Client::new();

    let mut res = client.get("http://www.baidu.com").send().unwrap();
    assert_eq!(res.status, hyper::Ok);
    let mut buffer = String::new();
    res.read_to_string(&mut buffer).unwrap();
    println!("{}", buffer);
}
