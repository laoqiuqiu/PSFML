{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
           ___  ___  ___  __  __  _
          | _ \/ __|| __||  \/  || |
          |  _/\__ \| _| | |\/| || |__
          |_|  |___/|_|  |_|  |_||____|
PSFML - Simple and Fast Multimedia Library for Pascal

Includes the following open-sources libraries:
* CSFML - https://github.com/SFML/CSFML

Copyright © 2023-present tinyBigGAMES™ LLC
All Rights Reserved.

Website: https://tinybiggames.com
Email  : support@tinybiggames.com

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its
   contributors may be used to endorse or promote products derived from
   this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}

unit utestbed;

interface

uses
  System.SysUtils,
  PSFML.Core,
  PSFML.Utils,
  PSFML.ZipFile;

procedure RunTest(const ANum: UInt64);
procedure RunTests;

implementation

const
  CZipPassword = '153e23283fb649fb8da0d0f3a938c2a7';
  CZipFilename = 'Data.zip';

procedure Pause;
begin
  WriteLn;
  Write('Press ENTER to continue...');
  ReadLn;
  WriteLn;
end;

procedure Test01;
var
  LMode: sfVideoMode;
  LRenderWindow: PsfRenderWindow;
  LEvent: sfEvent;
begin
  LMode.Width := 800;
  LMode.Height := 600;
  LMode.BitsPerPixel := 32;

  LRenderWindow := sfRenderWindow_create(LMode, 'SFML Window',
    sfResize or sfClose, nil);
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
end;

procedure Test02;
var
  LMode: sfVideoMode;
  LRenderWindow: PsfRenderWindow;
  LEvent: sfEvent;
begin
  LMode.Width := 800;
  LMode.Height := 600;
  LMode.BitsPerPixel := 32;

  LRenderWindow := sfRenderWindow_create(LMode, 'SFML Scaled Window',
    sfClose, nil);
  SetDefaultIcon(LRenderWindow);
  ScaleWindowToMonitor(LRenderWindow);

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
end;

procedure Test03;
var
  LMode: sfVideoMode;
  LRenderWindow: PsfRenderWindow;
  LEvent: sfEvent;
  LMusic: PsfMusic;
begin
  LMode.Width := 800;
  LMode.Height := 600;
  LMode.BitsPerPixel := 32;

  LRenderWindow := sfRenderWindow_create(LMode, 'SFML Music',
    sfClose, nil);
  SetDefaultIcon(LRenderWindow);
  ScaleWindowToMonitor(LRenderWindow);

  LMusic := sfMusic_createFromFile('res/music/song01.ogg');
  sfMusic_setLoop(LMusic, sfTrue);
  sfMusic_play(LMusic);

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

  sfMusic_stop(LMusic);
  sfMusic_destroy(LMusic);
  sfRenderWindow_destroy(LRenderWindow);
end;

procedure sfZipFileBuildProgress(const ASender: Pointer;
  const AFilename: string; const AProgress: Integer;
  const ANewFile: Boolean);
begin
  if ANewFile then WriteLn;
  Write(Format(#13'%s(%d%s)...', [AFilename, AProgress, '%']));
end;

procedure Test04;
begin
  WriteLn('Building ', CZipFilename, '...');
  if sfZipFile_build(CZipPassword, CZipFilename, 'res', nil,
    sfZipFileBuildProgress) then
    WriteLn(#10#10'Success!')
  else
    WriteLn(#10#10'Failed!');
end;

procedure Test05;
var
  LMode: sfVideoMode;
  LRenderWindow: PsfRenderWindow;
  LEvent: sfEvent;
  LMusic: PsfMusic;
  LInputStream:  PsfInputStream;
begin
  LMode.Width := 800;
  LMode.Height := 600;
  LMode.BitsPerPixel := 32;

  LRenderWindow := sfRenderWindow_create(LMode,
    'SFML ZipFile Streaming Music', sfClose, nil);
  SetDefaultIcon(LRenderWindow);
  ScaleWindowToMonitor(LRenderWindow);

  LInputStream := sfZipFile_open(CZipPassword, CZipFilename,
    'res/music/song01.ogg');

  LMusic := sfMusic_createFromStream(LInputStream);
  sfMusic_setLoop(LMusic, sfTrue);
  sfMusic_play(LMusic);

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

  sfMusic_stop(LMusic);
  sfMusic_destroy(LMusic);

  sfZipFile_close(LInputStream);

  sfRenderWindow_destroy(LRenderWindow);
end;


procedure RunTest(const ANum: UInt64);
begin
  case ANum of
    01: Test01;
    02: Test02;
    03: Test03;
    04: Test04;
    05: Test05;
  end;
end;

procedure RunTests;
begin
  RunTest(05);
  Pause;
end;

end.
