# APLAutoHotKey
Application to generate AutoHotKey scripts to enable APL glyph keyboard input

## TODO
- [ ] Enumerate all options
- [ ] Test individual options
- [ ] Test combinations of options

## Options

### Layouts
- [x] en_GB
- [x] en_US
- [x] da_DK
- [x] de_DE
- [x] es_ES
- [x] fr_FR
- [ ] it_IT
- [ ] fi_FI

- [ ] Check IME matches https://dfns.dyalog.com/n_keyboards.htm (⍺ ⍵ French)

### Shifting key
This is a key which, while pressed, enables the input of APL glyphs. For example, <kbd>Ctrl + e</kbd> produces `∊`.

- [x] CapsLock
- [ ] Left Control
- [ ] Right Control
- [ ] Left Alt
- [ ] Right Alt
- [ ] AltGr
- [ ] Can translate JS key code into AHK SC scan code?

### Prefix key
A **prefix key**, also known is a **dead key**, is a key which itself does not produce a character. After the prefix key is pressed, the next key may produce an APL glyph.

For example, if backtick/grave (\`) is the prefix key, then <kbd>\`</kbd> followed by `e` produces `∊`.
