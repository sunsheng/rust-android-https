extern crate hyper;
extern crate openssl;
use std::io::Read;
use hyper::net::{HttpsConnector, OpensslClient};
use openssl::ssl::{SslContext, SslMethod};
fn main() {

    let address = "https://www.baidu.com";
    let address = "http://www.sina.com.cn/";
    let mut context = SslContext::new(SslMethod::Sslv23).unwrap();
    context.set_CA_file(std::path::Path::new("/data/local/tmp/cacert.pem")).unwrap();
    let conn = HttpsConnector::new(OpensslClient::new(context));
    let client = hyper::Client::with_connector(conn);
    // let client = Openssl::default().wrap_client(client, address).unwrap();
    let mut res = client.get(address).send().unwrap();
    assert_eq!(res.status, hyper::Ok);
    let mut buffer = String::new();
    res.read_to_string(&mut buffer).unwrap();
    println!("{}", address);
    println!("{}", buffer.len());



}
