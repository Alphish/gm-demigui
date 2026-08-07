styles_provider.add_family("button", ["hover", "active", "disabled"])
    .with_style("hover", { image_blend: merge_color(c_white, c_yellow, 0.5) });

styles_provider.add_family("select", ["hover", "active", "disabled"])
    .with_base({ image_alpha: 0.6 })
    .with_style("hover", { image_alpha: 0.8 })
    .with_style("active", { image_alpha: 1.0 });
