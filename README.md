| :warning: | PRE-ALPHA |
|-----------|:----------|

# StandardKit Styles

SCSS Framework for the StandardKit Design & Component System

## Principles

### Standards & Defaults
### Multi-Path Solutions
### Cascading Configuration
### Built-to-Extend


## Modifiers, Flavors, Components & Types


### Modifiers
A modifier is a characteristic that can be modified. 
Something that you can change.
Examples are:
- `color`
- `fill`
- `margin`

<sub>Example selection, please check the documentation website for a full list.</sub>

All modifiers work the same from the outside. For example to apply a different `padding` to a component, you would say:
```html
<div class="padding--xl">
    A div with padding 'xl'
</div>
```

As you can probably tell, we use two hyphens (BEM-style) to select an alternative.


### Flavors
Modifiers can have a number of flavors defined. For example:
```scss
$color: (
  error: red,
  warning: orange,
  info: blue,
  success: green
);
```
<sub>This is a simplified example. Check the `theme` for the actual values.</sub>


### Custom Flavors
There are two types of modifiers; `static` & `configurable`. 

#### Static Modifiers
An example of a `static` modifier is: 
- `case` (`lowercase`, `uppercase` `capitalized`).

Since there is a limited / hardcoded number of options here, it doesn't make sense to expand. 

<sub>
If however you feel that there is a usecase to expand on one of the static modifiers, 
please create an issue and let us know! <br>
StandardKit is never perfect and you should be able to use it the way you want it.
</sub>

#### Configurable Modifiers
Most modifiers are configurable. This means that you can add your own flavors, as well as override pre-defined ones.
For example:
```scss
// Override the error color to 'purple' and adding our own 'custom' color
$colors: (
  error: purple,
  custom: hotpink
);
```
Now you could use this the following:
```html
<div class="color--custom">
    My custom colored div
</div>
```


### Components
A component (e.g. `alert` or `button`) usually has a number of modifiers available. 
For instance, let's look at the `button` component.
```html
<button class="button color--primary margin--xl padding--xs">
    Click me
</button>
```
Next to the modifiers that you can see are being set here, like `padding--xs`, 
the component also has a number of default modifiers.
As you might have expected from StandardKit, you can override / configure this. For example:
```scss
$components: (
  button: (
    default-color: primary,
    default-margin: xl,
    default-padding: xs
  )
);
```
Now, you can just use:
```html
<div class="button">
    I am a configured button
</div>
```
This becomes useful as you have more buttons scattered through-out your application.


### Types
Most of the time, applications tend to have multiple definitions of a button. 
For example, we might have a `cta-button`, a `save-button` and a `cancel-button`.
Using just the component configuration, you can only optimize for one situation. With types, we don't have to.
##### Types are a compound component definition that combines multiple modifiers on top of the default modifiers
For example:
```scss
$components: (
  button: (
    default-color: primary,
    cta: ( default-color: custom, default-margin: xl),
    save: ( padding: xs),
    cancel: ( color: error )
  )
);
```
To now use these three buttons, I can just:
```html
<button class="button--cta">Call-to-Action</button>

<button class="button--save">Save</button>

<button class="button--cancel">Cancel</button>
```
Very simple yet powerful.


### Special Cases
A couple of modifiers are special.
#### Color & Fill Combo
This is relevant because `color` depends on `fill`. <br> 
For instance, with a `fill: 'fill'` the `text` color is the `contrast` color and the `background` is the `main` color.  
<sub>See `Color Generation` for more information about colors and their (generated) subsets.</sub>

#### Complex Modifiers
Some modifiers can be configured a little bit more than others. For example:
```scss
// Colors
$colors: (
  primary: #fff,
  secondary: (main: #fff, complement: #f00, contrast: #000, complement-contrast: #0ff )
);

// Elevation
$elevation: (
  high: 20,
  custom: () // TODO : Implement 
);
```
<sub>In this case all values are optional, but you need at least `main` or `complement` to generate the others.</sub>

#### Breakpoints
Breakpoints is a configurable modifiers, you can add or change them to your liking. <br> 
By default it's using `em` but feel free to change to what you want.

However, sometimes you want to change the behaviour of other modifiers based on the viewport. For example:
```scss
$margins: (
  custom: ( start: square, s: 3rem, l: round )
)
```
As you can see, something weird is going on. 
I'm using `round` which is one of the flavors, but I'm also specifying `3rem`, an actual value. 
This always looks for the flavor first. So it would be unwise to call a flavor by one of the values.

StandardKit uses the `start` keyword to distinguish if this is a breakpoint-scenario. 
This is only needed in case of complex modifiers, like `color` or `elevation`.

## Configuration

### Theme Options
A list of the default theme options.
```scss
$options: (
  prefer-dark-colors: false,
  contrast-threshold: 42%,
  contrast-value-percentage: 2%,
  complement-value-percentage: 7%,
  brightness-weights: (
    red: .229,
    green: .576,
    blue: .119 
  ),
  include-fonts : true or false, // default: true
  merge-modifiers: 'replace' or 'merge', // default: merge
  modifier-sets: 'minimal' or 'basic' or 'all' // default: all
)
```


### Modifier Options

```scss
$options: (
  flavors: (),
  flavor-options: (
    default: '',
    set: 'minimal' | 'basic' | 'all',
    exclude: [],
    include: [],
    merge: 'merge' | 'replace'
  )
)
```

## Modifiers

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
  
### Non-Flavorable Modifiers
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
