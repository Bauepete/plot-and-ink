//
//  Index.swift
//  
//
//  Created by Peter Bauer on 21.02.23.
//
import Plot

let aboutPage = HTML(
    .head(
        .title("Genussmodlerei"),
        .meta(.charset(.utf8)),
        .meta(.attribute(named: "viewport", value: "width=device-width, initial-scale=1.0")),
        .stylesheet("basic-style.css")
    ),
    .body(
        .article(
            .div(.class("banner")),
            .component(AboutContent())
        )
    )
)

struct AboutContent: Component {
    var body: Component {
        Div {
            Node<HTML.BodyContext>.raw(parseMdFile())
        }.class("content")
    }
}
