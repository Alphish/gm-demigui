styles_provider = new DemiguiStylesProvider();
styles_provider.add_family("none", []);

get_style = function(_specifier) {
    return styles_provider.provide(_specifier);
}
