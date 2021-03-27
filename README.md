| :warning: | PRE-ALPHA |
|-----------|:----------|

# StandardKit Styles

SCSS Framework for the StandardKit Design & Component System

## Configuration

### Theme Options

```scss
$options: (
  dark-color-generation: false, // TODO : more from color utility config
  include-fonts : false
)
```

- font // todo
- breakpoints // todo

### Modifier Options

```scss
$options: (
  flavors : (),
  default-flavor: '',
  use-flavors : 'single' | 'basic' | 'all',
  exclude-flavors: [],
  include-flavors: [],
  merge-flavor: 'merge' | 'replace'
)
```

## Modifiers

### Configurable Modifiers
These are modifiers that you can add your own flavors or overwrite existing values. For example:
```scss
// style.scss
$colors: ( custom: hotpink );
$margins: ( huge: 16rem );
```
Now you can use this flavor. Color is a special flavor where it is often used as a primary type.
For most flavors, it works like the 'huge' margin in the example.
```html
<div class="alert alert--custom margin--huge">
    My custom hotpink alert
</div>
```
### All Modifiers
Below is a list of all modifiers and their default flavors.
The values in the format are placeholders, check the theme reference for actual values.

| Modifier | Format | Description | 
|---|---|---|
&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;
color | #fff, red <br>(<br>main: #fff,<br>complement: #fff,<br>contrast: #fff,<br>complement-contrast:&nbsp;#fff<br>) | A single color or a color map. all values of the map are optional, but it needs at least a main or a complement to generate the rest. 
fill-type | (<br>text: main,<br>border: contrast,<br>background: complement<br>) | The way color is used to fill elements.
elevation | 

- margin
- padding
- size
- width

- corner
- border
- capitalization
- focus
- hover
- disabled
- active
- alignment
- position
- highlight

## Components

- alert
- button
