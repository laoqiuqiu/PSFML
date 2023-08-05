![SFML](media/sfml-logo.png)  

[![Chat on Discord](https://img.shields.io/discord/754884471324672040.svg?logo=discord)](https://discord.gg/tPWjMwK) [![Twitter Follow](https://img.shields.io/twitter/follow/tinyBigGAMES?style=social)](https://twitter.com/tinyBigGAMES)
# PSFML
### Simple and Fast Multimedia Library for Pascal

Pascal bindings that allow you to use **SFML** and other useful libraries with <a href="https://www.embarcadero.com/es/products/delphi" target="_blank">Delphi</a> and <a href="https://www.freepascal.org" target="_blank">FreePascal</a>.

### Included
- **CSFML** (https://github.com/SFML/CSFML)

### Minimum Requirements 
- Should work on Windows 7+ (64 bits)
- Should work on any Delphi/FreePascal that can target Win64/Unicode

### Usage
You simply add `PSFML` to your uses section and everything will be linked in your executable, ready for use with no DLLs to maintain. You will have direct access to all the aforementioned libraries.

```Pascal
uses
  System.SysUtils,
  PSFML;

var
  LMode: sfVideoMode;
  LRenderWindow: PsfRenderWindow;
  LEvent: sfEvent;
begin
  LMode.Width := 800;
  LMode.Height := 600;
  LMode.BitsPerPixel := 32;

  LRenderWindow := sfRenderWindow_create(LMode, 'SFML Window', sfResize or sfClose, nil);
  SetDefaultIcon(LRenderWindow);

  while sfRenderWindow_isOpen(LRenderWindow) = sfTrue do
  begin
    while sfRenderWindow_pollEvent(LRenderWindow, @LEvent) = sfTrue do
    begin
      if LEvent.type_ = sfEvtClosed then
        sfRenderWindow_close(LRenderWindow);
    end;

    sfRenderWindow_clear(LRenderWindow, DARKSLATEBROWN);
    sfRenderWindow_display(LRenderWindow);
  end;

  sfRenderWindow_destroy(LRenderWindow);
end.
```

### Support
- <a href="https://github.com/tinyBigGAMES/PSFML/issues" target="_blank">Issues</a>
- <a href="https://github.com/tinyBigGAMES/PSFML/discussions" target="_blank">Discussions</a>
- <a href="https://www.sfml-dev.org/" target="_blank">SFML website</a>

<p align="center">
 <a href="https://www.embarcadero.com/products/delphi" target="_blank"><img src="media/delphi.png"></a>
 <a href="https://www.freepascal.org" target="_blank"><img src="media/FreePascal.gif"></a><br/> 
 ♥ <b>Made for Pascal</b>
</p>