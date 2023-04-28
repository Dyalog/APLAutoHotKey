# APLAutoHotKey
Application to generate AutoHotKey scripts to enable APL glyph keyboard input

## TODO
- [x] Enumerate options
- [ ] Test individual options
- [ ] Test combinations of options
- [ ] Suspend key combination + suspend when Classic window active

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
- [ ] sv_SE

> Other layouts can be supported on request, or generated by the user if they create the appropriate key map

- [ ] Check IME matches https://dfns.dyalog.com/n_keyboards.htm (⍺ ⍵ French)

### Shifting key
This is a key which, while pressed, enables the input of APL glyphs. For example, <kbd>Ctrl + e</kbd> produces `∊`.

- [x] CapsLock
- [ ] Left Control
- [ ] Right Control
- [ ] Control (both)
- [ ] Left Alt
- [ ] Right Alt
- [ ] Alt (both)
- [ ] LWin
- [ ] RWin
- [ ] Win (both)
- [ ] AltGr

> AltGr sends a LCtrl+LAlt signal. AltGr and LAlt can get different behaviours by mapping `<^>!::RAlt` and using `LAlt` and `RAlt`. If both Left Alt and Right Alt are selected, then a single `Alt` hotkey is used, but if only Left Alt is selected, then `AltGr` must be remapped to `RAlt`. TODO: does this affect e.g. accents or special characters via AltGr on regular Windows keyboard?
> Use of `LCtrl`, `Ctrl`, `RAlt` or `Alt` can interfere with `AltGr` behaviour

### Prefix key
A **prefix key**, also known is a **dead key**, is a key which itself does not produce a character. After the prefix key is pressed, the next key may produce an APL glyph.

For example, if backtick/grave (\`) is the prefix key, then <kbd>\`</kbd> followed by `e` produces `∊`.
