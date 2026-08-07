styles_provider.add_family("button", ["hover", "disabled"])
    .with_style("hover", { image_blend: merge_color(c_white, c_yellow, 0.5) });

styles_provider.add_family("select", ["hover", "disabled", "active"])
    .with_base({ image_alpha: 0.6 })
    .with_style("hover", { image_alpha: 0.8 })
    .with_style("active", { image_alpha: 1.0 });

styles_provider.add_family("checkbox", ["hover", "disabled", "checked", "indeterminate"])
    .with_base({ image_index: 0 })
    .with_style("hover", { image_blend: #80ff80 })
    .with_style("checked", { image_index: 1 })
    .with_style("indeterminate", { image_index: 2 });
