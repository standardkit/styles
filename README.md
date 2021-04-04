| :warning: | PRE-ALPHA |
|-----------|:----------|

# StandardKit Styles

SCSS Framework for the StandardKit Design & Component System
<hr>

## Principles

The idea of StandardKit is based on a collection of thoughts and issues with the state of SCSS Frameworks, Component
Libraries & UI Kits. To name a few:

- It should be easy to use
- It should look good by default
- It should take into account accessibility & other web-standards
- I want to customize variables like colors, margins or corners
- I want to add my own custom flavors
- I should be able to easily override anything (without !important)
- I should be able to extend it and add my own behaviour
- I should be able to solve problems in my or my teams way of working
- It should guide me in the right direction
- I do not want to repeat myself
- HTML should be clean & simple to use
- I don't want any boilerplate code, I just want exactly what I need in my bundle
- I want good documentation where I can find specifically what EVERYTHING does
- I should be able to quickly build something with it
- Different parts of the framework should work as they do elsewhere

All of this is meant to put the developer first. You should be able to quickly & easily design & build quality
applications for your users.

This makes StandardKit a great fit for Rapid Prototyping but also prepared for expansion.

These ideas distill into the four main principles to which we validate our framework.

<hr>  

### Defaults & Standards

Everything should look & work simply by default. It uses standards to give you multiple way of doing things while
remaining consistent & straight-forward.

Easy way to style a button:

```html

<button class="button">
    Click
</button>
```

An example of standards: Modifiers work the same across components.

```html
<!--A button with modified margin-->
<button class="button margin--xl">
    Click
</button>

<!--An alert with modified padding-->
<div class="alert padding--xl">
    Message
</div>
```

<sub>Just an example, it is possible with configuration to set `padding--xl` for all alerts by default</sub>
<hr>

### Multi-Path Solutions

There are no one-way solutions. Instead, we provide utilities for different strategies.

<sub>If you find a strategy, perspective or solution that is missing, let us know!</sub>

<hr>

### Cascading Configuration

Everything should be configurable and cascade on multiple levels.

```scss
// configuration.scss
$components: (
  button: (
    default-color: primary,
    save: (default-color: success, default-fill: outline),
    cancel: (extend: save, default-color: error)
  )
);
```

```html
<!--page.html-->
<button class="button">Button</button>
<button class="button--save">Save</button>
<button class="button--cancel">Cancel</button>
```

<sub>Here, the `cancel` button extends and overwrites the `save` button, which overwrite the `default` button.</sub>

<hr>

### Built-to-Extend

Everything should be easily extendable, we even expect you to add your own customizations.

```scss
// Adding a custom color
$colors: (
  custom: #abcdef
);

// Extending the button and adding behaviour
@extend .button--custom
{
  border-radius: 1rem;
  transition: background-color 2s ease-out;
}
```

<hr>

## Modifiers, Flavors, Components & Types

<hr>

### Modifiers

A modifier is a characteristic that can be modified. Something that you can change. Examples are:

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

<hr>

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

<hr>

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

Most modifiers are configurable. This means that you can add your own flavors, as well as override pre-defined ones. For
example:

```scss
// Override the error color to 'purple' and adding our own 'custom' color
$colors: (
  error: purple,
  custom: hotpink
);
```

Now you could use this the following way:

```html

<div class="color--custom">
    My custom colored div
</div>
```

<hr>

### Components

A component (e.g. `alert` or `button`) usually has a number of modifiers available. For instance, let's look at
the `button` component.

```html

<button class="button color--primary margin--xl padding--xs">
    Click me
</button>
```

Next to the modifiers that you can see are being set here, like `padding--xs`, the component also has a number of
default modifiers. As you might have expected from StandardKit, you can override / configure this. For example:

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

<button class="button">
    I am a configured button
</button>
```

This becomes useful when you have more buttons scattered through-out your application.

<hr>

### Types

Most of the time, applications tend to have multiple definitions of a button. For example, we might have a `cta-button`,
a `save-button` and a `cancel-button`. Using just the component configuration, you can only optimize for one situation.
With types, we don't have to.

##### Types are a compound component definition that combines multiple modifiers on top of the default modifiers

For example:

```scss
$components: (
  button: (
    default-color: primary,
    cta: (default-color: custom, default-margin: xl),
    save: (default-padding: xs),
    cancel: (default-color: error)
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

<hr>

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
  secondary: (main: #fff, complement: #f00, contrast: #000, complement-contrast: #0ff)
);

// Elevation
$elevation: (
  high: 20,
  custom: () // TODO : Implement 
);
```

<sub>In this case all values are optional, but you need at least `main` or `complement` to generate the others.</sub>

#### Breakpoints

Breakpoints are configurable modifiers, you can add or change them to your liking. <br>
By default it's using `em` but feel free to change to what you want.

However, sometimes you want to change the behaviour of other modifiers based on the viewport. For example:

```scss
$margins: (
  custom: (start: square, s: 3rem, l: round)
)
```

As you can see, something weird is going on. I'm using `round` which is one of the flavors, but I'm also
specifying `3rem`, an actual value. This always looks for the flavor first. So it would be unwise to call a flavor by
one of the values.

StandardKit uses the `start` keyword to distinguish if this is a breakpoint-scenario. This is only needed in case of
complex modifiers, like `color` or `elevation`.

##### This means that StandardKit is 'mobile-first'

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
  modifier-sets: 'none' or 'minimal' or 'basic' or 'all' // default: all
)
```

<hr>

### Modifier Options

```scss
$configuration: (
  color-options: (
    set: 'none' or 'minimal' or 'basic' or 'all',
    exclude: [],
    include: [],
    merge: 'merge' or 'replace'
  )
)
```

## Modifiers

Below is a list of all modifiers and their default flavors. The values in the format are placeholders, check the theme
reference for actual values.

### Configurable Modifiers

#### Complex ( e.g. #fff or (main: #fff, contrast: #000) )
- color
- fill-type
- elevation
  
#### Value based ( e.g. 1rem )
- margin
- padding
- size
- width
- corner
- border
- breakpoints

### Non-Flavorable Modifiers

For these modifiers you can not add your own flavors. However, you can of course still in- or exclude certain sets or
individual standard flavors.

- capitalization
- focus
- hover
- disabled
- active
- alignment
- position
- highlight

### Complex Modifiers

| Modifier | Format | Description | 
|---|---|---|
&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;
color | #fff, red <br>(<br>main: #fff,<br>complement: #fff,<br>contrast: #fff,<br>complement-contrast:&nbsp;#fff<br>) | A single color or a color map. all values of the map are optional, but it needs at least a main or a complement to generate the rest.
fill-type | (<br>text: main,<br>border: contrast,<br>background: complement<br>) | The way color is used to fill elements.
elevation |

## Components

- alert
- button
