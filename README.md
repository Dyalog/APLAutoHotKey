# APLAutoHotKey
Application to generate AutoHotKey scripts to enable APL glyph keyboard input

## TODO
- [ ] Enumerate all options
- [ ] Test individual options
- [ ] Test combinations of options

## Options

### Shifting key
This is a key which, while pressed, enables the input of APL glyphs. For example, <kbd>Ctrl + e</kbd> produces `∊`.

- [x] CapsLock
- [ ] Left Control
- [ ] Right Control
- [ ] Left Alt
- [ ] Right Alt
- [ ] AltGr

### Prefix key
A **prefix key**, also known is a **dead key**, is a key which itself does not produce a character. After the prefix key is pressed, the next key may produce an APL glyph.

For example, if backtick/grave (\`) is the prefix key, then <kbd>\`</kbd> followed by `e` produces `∊`.

### Accent scheme for Latin characters
With this option enabled, characters with diacritics **acute** (`á`), **grave** (`à`), **circumflex** (`â`), **diaeresis** (`ä`) and **tilde** (`ã`) can be typed.

#### Shifting key

Here, <kbd>APL</kbd> refers to the APL shifting key.

<kbd>APL+Shift+a</kbd> → <kbd>a</kbd> produces `á`.

#### Prefix key