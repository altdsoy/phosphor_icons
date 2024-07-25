# Phosphor Icons

This package will import the beautiful icon set from Phosphor Icons including all available variants.

Check them at [Phosphor Icons](https://phosphoricons.com/)!

## Installation

The package can be installed by adding `phosphor_icons` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [ 
    # ...,
    {:phosphor_icons, "~> 0.0.1", compile: false, app: false}
  ]
end
```

The docs can be found at <https://hexdocs.pm/phosphor_icons>.

## Usage with Phoenix <.icon />

If you are using the default Phoenix's `CoreComponents.icon` with Tailwind CSS, you can simply use the icons like this:

```html
<!-- regular styled icons -->
<.icon name="pi-NAME" />

<!-- variants -->
<.icon name="pi-NAME-VARIANT" />
```

where:

- `NAME` is the icon name shown in the [Phosphor Icons website](https://phosphoricons.com/#toolbar).
- `VARIANT` is one of the available variants: `thin`, `light`, `bold`, `fill`, `duotone`

Here is some examples:

```html
<.icon name="pi-drop-thin" />
<.icon name="pi-drop-light" />
<.icon name="pi-drop" /> <!-- regular -->
<.icon name="pi-drop-bold" />
<.icon name="pi-drop-fill" />
<.icon name="pi-drop-duotone" />

<.icon name="pi-drop-half-bottom-thin" />
<.icon name="pi-drop-half-bottom-light" />
<.icon name="pi-drop-half-bottom" /> <!-- regular -->
<.icon name="pi-drop-half-bottom-bold" />
<.icon name="pi-drop-half-bottom-fill" />
<.icon name="pi-drop-half-bottom-duotone" />
```

### Tailwind CSS Config

You have to update the Tailwind CSS config with the following (or something similar):

```js
// assets/tailwind.config.js
module.exports = {
  // ...
  plugins: [
    // ..
    plugin(function ({ matchComponents, theme }) {
      let baseDir = path.join(__dirname, "../deps/phosphor_icons/core/raw");
      // for an umbrella app use the following instead
      // let baseDir = path.join(__dirname, "../../../deps/phosphor_icons/core/raw");
      let values = {};
      let icons = fs
        .readdirSync(baseDir, { withFileTypes: true })
        .filter((dirent) => dirent.isDirectory())
        .map((dirent) => dirent.name);

      icons.forEach((dir) => {
        fs.readdirSync(path.join(baseDir, dir)).map((file) => {
          let name = path.basename(file, ".svg");

          values[name] = { name, fullPath: path.join(baseDir, dir, file) };
        });
      });

      matchComponents(
        {
          pi: ({ name, fullPath }) => {
            let content = fs
              .readFileSync(fullPath)
              .toString()
              .replace(/\r?\n|\r/g, "");

            return {
              [`--pi-${name}`]: `url('data:image/svg+xml;utf8,${content}')`,
              "-webkit-mask": `var(--pi-${name})`,
              mask: `var(--pi-${name})`,
              "background-color": "currentColor",
              "vertical-align": "middle",
              display: "inline-block",
              width: theme("spacing.10"),
              height: theme("spacing.10"),
            };
          },
        },
        { values }
      );
    })
  ]
}
```

## Usage of SVG images

This package is simply importing all the SVG icons.

They can be found in your `deps` folder at:
`deps/phosphor_icons/core/raw/VARIANT/NAME.svg` where:

- `VARIANT` is one of the available variant: `thin`, `light`, `regular`, `bold`, `fill`, `duotone`
- `NAME` is the icon name shown in the [Phosphor Icons website](https://phosphoricons.com/#toolbar).

## Disclaimer

This package is not affiliated with Phosphor Icons.

This repo is using the Phosphor Icons Core repository as a source: [`phosphor-icons/core`](https://github.com/phosphor-icons/core).

The version of this package should match the Phosphor Icons version.

## License

MIT
