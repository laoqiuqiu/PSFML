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

unit PSFML.ZipFile;

{$I PSFML.Defines.inc}

interface

uses
  PSFML.Core;

type
  { TsfZipFileBuildProgressEvent }
  TsfZipFileBuildProgressEvent = procedure(const aSender: Pointer;
   const aFilename: string; const aProgress: Integer;
   const ANewFile: Boolean);

function sfZipFile_build(const APassword, AZipFilename, ADirectory: string;
  const ASender: Pointer;
  const AHandler: TsfZipFileBuildProgressEvent): Boolean;

function sfZipFile_open(const APassword, AZipFilename,
  AFilename: string): PsfInputStream;

function sfZipFile_close(var AInputStream: PsfInputStream): Boolean;

implementation

{$REGION ' TEncryptedZipFile '}
uses
  System.Types,
  System.SysUtils,
  System.IOUtils,
  System.Classes,
  System.ZLib,
  System.Zip;

type
  EZipInvalidOperation = class(EZipException);
  EZipPasswordException = class(EZipException);
  EZipNoPassword = class(EZipPasswordException);
  EZipInvalidPassword = class(EZipPasswordException);

type
  TEncryptedZipFile = class(TZipFile)
  strict private
    class constructor Create;
  private
    FPassword: string;
  public
    constructor Create(const aPassword: string);
    class function HasPassword(const aZipFile: TZipFile): Boolean;
    property Password: string read FPassword write FPassword;
  end;
//DOM-IGNORE-END

resourcestring
  SInvalidPassword = 'invalid password';
  SNoPassword = 'no password';
  SInvalidOp = 'Invalid Stream operation!';

type

  TCryptor = class
  private const
    CRC32_TABLE: array [0 .. 255] of longword = (
      $00000000, $77073096, $EE0E612C, $990951BA, $076DC419, $706AF48F, $E963A535, $9E6495A3,
      $0EDB8832, $79DCB8A4, $E0D5E91E, $97D2D988, $09B64C2B, $7EB17CBD, $E7B82D07, $90BF1D91,
      $1DB71064, $6AB020F2, $F3B97148, $84BE41DE, $1ADAD47D, $6DDDE4EB, $F4D4B551, $83D385C7,
      $136C9856, $646BA8C0, $FD62F97A, $8A65C9EC, $14015C4F, $63066CD9, $FA0F3D63, $8D080DF5,
      $3B6E20C8, $4C69105E, $D56041E4, $A2677172, $3C03E4D1, $4B04D447, $D20D85FD, $A50AB56B,
      $35B5A8FA, $42B2986C, $DBBBC9D6, $ACBCF940, $32D86CE3, $45DF5C75, $DCD60DCF, $ABD13D59,
      $26D930AC, $51DE003A, $C8D75180, $BFD06116, $21B4F4B5, $56B3C423, $CFBA9599, $B8BDA50F,
      $2802B89E, $5F058808, $C60CD9B2, $B10BE924, $2F6F7C87, $58684C11, $C1611DAB, $B6662D3D,
      $76DC4190, $01DB7106, $98D220BC, $EFD5102A, $71B18589, $06B6B51F, $9FBFE4A5, $E8B8D433,
      $7807C9A2, $0F00F934, $9609A88E, $E10E9818, $7F6A0DBB, $086D3D2D, $91646C97, $E6635C01,
      $6B6B51F4, $1C6C6162, $856530D8, $F262004E, $6C0695ED, $1B01A57B, $8208F4C1, $F50FC457,
      $65B0D9C6, $12B7E950, $8BBEB8EA, $FCB9887C, $62DD1DDF, $15DA2D49, $8CD37CF3, $FBD44C65,
      $4DB26158, $3AB551CE, $A3BC0074, $D4BB30E2, $4ADFA541, $3DD895D7, $A4D1C46D, $D3D6F4FB,
      $4369E96A, $346ED9FC, $AD678846, $DA60B8D0, $44042D73, $33031DE5, $AA0A4C5F, $DD0D7CC9,
      $5005713C, $270241AA, $BE0B1010, $C90C2086, $5768B525, $206F85B3, $B966D409, $CE61E49F,
      $5EDEF90E, $29D9C998, $B0D09822, $C7D7A8B4, $59B33D17, $2EB40D81, $B7BD5C3B, $C0BA6CAD,
      $EDB88320, $9ABFB3B6, $03B6E20C, $74B1D29A, $EAD54739, $9DD277AF, $04DB2615, $73DC1683,
      $E3630B12, $94643B84, $0D6D6A3E, $7A6A5AA8, $E40ECF0B, $9309FF9D, $0A00AE27, $7D079EB1,
      $F00F9344, $8708A3D2, $1E01F268, $6906C2FE, $F762575D, $806567CB, $196C3671, $6E6B06E7,
      $FED41B76, $89D32BE0, $10DA7A5A, $67DD4ACC, $F9B9DF6F, $8EBEEFF9, $17B7BE43, $60B08ED5,
      $D6D6A3E8, $A1D1937E, $38D8C2C4, $4FDFF252, $D1BB67F1, $A6BC5767, $3FB506DD, $48B2364B,
      $D80D2BDA, $AF0A1B4C, $36034AF6, $41047A60, $DF60EFC3, $A867DF55, $316E8EEF, $4669BE79,
      $CB61B38C, $BC66831A, $256FD2A0, $5268E236, $CC0C7795, $BB0B4703, $220216B9, $5505262F,
      $C5BA3BBE, $B2BD0B28, $2BB45A92, $5CB36A04, $C2D7FFA7, $B5D0CF31, $2CD99E8B, $5BDEAE1D,
      $9B64C2B0, $EC63F226, $756AA39C, $026D930A, $9C0906A9, $EB0E363F, $72076785, $05005713,
      $95BF4A82, $E2B87A14, $7BB12BAE, $0CB61B38, $92D28E9B, $E5D5BE0D, $7CDCEFB7, $0BDBDF21,
      $86D3D2D4, $F1D4E242, $68DDB3F8, $1FDA836E, $81BE16CD, $F6B9265B, $6FB077E1, $18B74777,
      $88085AE6, $FF0F6A70, $66063BCA, $11010B5C, $8F659EFF, $F862AE69, $616BFFD3, $166CCF45,
      $A00AE278, $D70DD2EE, $4E048354, $3903B3C2, $A7672661, $D06016F7, $4969474D, $3E6E77DB,
      $AED16A4A, $D9D65ADC, $40DF0B66, $37D83BF0, $A9BCAE53, $DEBB9EC5, $47B2CF7F, $30B5FFE9,
      $BDBDF21C, $CABAC28A, $53B39330, $24B4A3A6, $BAD03605, $CDD70693, $54DE5729, $23D967BF,
      $B3667A2E, $C4614AB8, $5D681B02, $2A6F2B94, $B40BBE37, $C30C8EA1, $5A05DF1B, $2D02EF8D);

  private
    FKey: array [0 .. 2] of Int64;
  protected
    function CalcDecryptByte: Byte;
    function UpdateCRC32(aKey: longword; aValue: Byte): longword;
    procedure UpdateKeys(aValue: Byte);
  public
    procedure InitKeys(const APassword: string);
    procedure DecryptByte(var aValue: Byte);
    procedure EncryptByte(var aValue: Byte);
  end;

  TCryptStream = class(TStream)
  private
    FCryptor: TCryptor;
    FPassword: string;
    FStream: TStream;
    FStreamStartPos: Int64;
    FStreamEndPos: Int64;
    FStreamSize: Int64;
    FZipHeader: TZipHeader;
  protected
    procedure InitHeader; virtual; abstract;
    procedure InitKeys;
    procedure ResetStream;
    property Stream: TStream read FStream;
  public
    constructor Create(aStream: TStream; const aPassword: string; const aZipHeader: TZipHeader);
    destructor Destroy; override;
    function Read(var aBuffer; aCount: Integer): Integer; override;
    function Seek(const aOffset: Int64; aOrigin: TSeekOrigin): Int64; override;
    function Write(const aBuffer; aCount: Integer): Integer; override;
  end;

  TDecryptStream = class(TCryptStream)
  protected
    procedure InitHeader; override;
    function Skip(aValue: Int64): Int64;
  public
    function Read(var aBuffer; aCount: Integer): Integer; override;
    function Seek(const aOffset: Int64; aOrigin: TSeekOrigin): Int64; override;
  end;

  TEncryptStream = class(TCryptStream)
  protected
    procedure InitHeader; override;
  public
    function Write(const aBuffer; aCount: Integer): Integer; override;
  end;

  TEncryptedZCompressionStream = class(TMemoryStream)
  private
    FPassword: string;
    FTarget: TStream;
    FZipHeader: PZipHeader;
    procedure EncryptToTarget;
  protected
    property ZipHeader: PZipHeader read FZipHeader;
  public
    constructor Create(aTarget: TStream; const aPassword: string; const aZipHeader: TZipHeader);
    destructor Destroy; override;
    property Password: string read FPassword;
    property Target: TStream read FTarget;
  end;

{ TEncryptedZipFile }
class constructor TEncryptedZipFile.Create;
begin
  RegisterCompressionHandler(
    zcDeflate,
    function(aInStream: TStream; const aZipFile: TZipFile; const aItem: TZipHeader): TStream
    begin
      if HasPassword(aZipFile) then begin
        Result := TEncryptedZCompressionStream.Create(aInStream, TEncryptedZipFile(aZipFile).Password, aItem);
      end
      else begin
        Result := TZCompressionStream.Create(aInStream, zcDefault, -15);
      end;
    end,
    function(aInStream: TStream; const aZipFile: TZipFile; const aItem: TZipHeader): TStream
    var
      LStream : TStream;
      LIsEncrypted: Boolean;
    begin
      LIsEncrypted := (aItem.Flag and 1) = 1;

      if Assigned(TZipFile.OnCreateDecompressStream) then
        LStream := TZipFile.OnCreateDecompressStream(aInStream, aZipFile, aItem, LIsEncrypted)
      else if Assigned(TZipFile.CreateDecompressStreamCallBack) then
        LStream := TZipFile.CreateDecompressStreamCallBack(aInStream, aZipFile, aItem, LIsEncrypted)
      else if LIsEncrypted and (aZipFile is TEncryptedZipFile) then
        LStream := TDecryptStream.Create(aInStream, TEncryptedZipFile(aZipFile).Password, aItem)
      else
        LStream := aInStream;
      Result := TZDecompressionStream.Create(LStream, -15, LStream <> aInStream);
    end
  );
end;

constructor TEncryptedZipFile.Create(const aPassword: string);
begin
  inherited Create;
  FPassword := aPassword;
end;

class function TEncryptedZipFile.HasPassword(const aZipFile: TZipFile): Boolean;
begin
  Result := (aZipFile is TEncryptedZipFile) and (TEncryptedZipFile(aZipFile).Password > '');
end;

constructor TCryptStream.Create(aStream: TStream; const aPassword: string; const aZipHeader: TZipHeader);
begin
  inherited Create;
  FCryptor := TCryptor.Create();
  FStream := aStream;
  FPassword := aPassword;
  FZipHeader := aZipHeader;
  if (FPassword = '') then
    raise EZipNoPassword.Create(SNoPassword);
  FStreamStartPos := FStream.Position;
  FStreamEndPos := FStream.Seek(0, soEnd);
  FStream.Position := FStreamStartPos;
  InitKeys;
  InitHeader;
end;

destructor TCryptStream.Destroy;
begin
  FCryptor.Free;
  inherited Destroy;
end;

procedure TCryptStream.InitKeys;
begin
  FCryptor.InitKeys(FPassword);
end;

function TCryptStream.Read(var aBuffer; aCount: Integer): Integer;
begin
  raise EZipInvalidOperation.Create(SInvalidOp);
end;

procedure TCryptStream.ResetStream;
begin
  if FStream.Position <> FStreamStartPos then begin
    FStream.Position := FStreamStartPos;
  end;
  InitKeys;
  InitHeader;
end;

function TCryptStream.Write(const aBuffer; aCount: Integer): Integer;
begin
  raise EZipInvalidOperation.Create(SInvalidOp);
end;

function TCryptStream.Seek(const aOffset: Int64; aOrigin: TSeekOrigin): Int64;
begin
  if (aOffset = 0) and (aOrigin = soCurrent) then
  begin
    result := FStream.Position;
  end
  else begin
    raise EZipInvalidOperation.Create(SInvalidOp);
  end;
end;

procedure TDecryptStream.InitHeader;
var
  LHeader: array [0..11] of Byte;
begin
  FStreamSize := FZipHeader.CompressedSize - Sizeof(LHeader);
  ReadBuffer(LHeader, Sizeof(LHeader));
  if LHeader[High(LHeader)] <> (FZipHeader.CRC32 shr 24) then
    raise EZipInvalidPassword.Create(SInvalidPassword);
end;

function TDecryptStream.Read(var aBuffer; aCount: Integer): Integer;
var
  P: PByte;
  I: Integer;
begin
  result := FStream.Read(aBuffer, aCount);
  P := @aBuffer;
  for I := 1 to result do begin
    FCryptor.DecryptByte(P^);
    Inc(P);
  end;
end;

function TDecryptStream.Seek(const aOffset: Int64; aOrigin: TSeekOrigin): Int64;
var
  LCurPos: Int64;
  LNewPos: Int64;
begin
  LCurPos := FStream.Position;
  LNewPos := LCurPos;
  case aOrigin of
    soBeginning: LNewPos := aOffset;
    soCurrent: LNewPos := LCurPos + aOffset;
    soEnd: LNewPos := FStreamEndPos + aOffset;
  end;
  if LNewPos < LCurPos then
    begin
      ResetStream;
      Result := Skip(LNewPos);
    end
  else
    begin
      Result := Skip(LNewPos - LCurPos);
    end;
end;

function TDecryptStream.Skip(aValue: Int64): Int64;
const
  cMaxBufSize = $F000;
var
  LBuffer: TBytes;
  LCnt: Integer;
begin
  if aValue < cMaxBufSize then
    SetLength(LBuffer, aValue)
  else
    SetLength(LBuffer, cMaxBufSize);

  LCnt := Length(LBuffer);

  while (FStream.Position+LCnt) < aValue do
  begin
    ReadBuffer(LBuffer, LCnt);
  end;

  if FStream.Position < aValue then
  begin
    LCnt := aValue - FStream.Position;
    ReadBuffer(LBuffer, LCnt);
  end;

  Result := FStream.Position;
end;

procedure TEncryptStream.InitHeader;
var
  LHeader: array[0..11] of Byte;
  I: Integer;
begin
  for I := 0 to 10 do begin
    LHeader[I] := Random(256);
  end;
  LHeader[11] := (FZipHeader.CRC32 shr 24);
  WriteBuffer(LHeader, Sizeof(LHeader));
end;

function TEncryptStream.Write(const aBuffer; aCount: Integer): Integer;
const
  cMaxBufSize = $10000;
var
  LBytes: TBytes;
  LCnt: Integer;
  I: Integer;
  P: PByte;
begin
  result := 0;
  if aCount < cMaxBufSize then
    SetLength(LBytes, aCount)
  else
    SetLength(LBytes, cMaxBufSize);

  P := @aBuffer;

  while aCount > 0 do
  begin
    LCnt := Length(LBytes);
    if aCount < LCnt then
      LCnt := aCount;
    Move(P^, LBytes[0], LCnt);
    Inc(P, LCnt);

    for I := 0 to LCnt - 1 do begin
      FCryptor.EncryptByte(LBytes[I]);
    end;

    Result := Result + FStream.Write(LBytes, LCnt);
    aCount := aCount - LCnt;
  end;
end;

{ TCryptor }
function TCryptor.CalcDecryptByte: Byte;
var
  LTemp: UInt64;
begin
  LTemp := FKey[2] or 2;
  Result := Word(LTemp * (LTemp xor 1)) shr 8;
end;

procedure TCryptor.InitKeys(const APassword: string);
var
  B: Byte;
begin
  FKey[0] := 305419896;
  FKey[1] := 591751049;
  FKey[2] := 878082192;

  for B in TEncoding.ANSI.GetBytes(APassword) do
  begin
    UpdateKeys(B);
  end;
end;

procedure TCryptor.DecryptByte(var aValue: Byte);
begin
  aValue := aValue xor CalcDecryptByte;
  UpdateKeys(aValue);
end;

procedure TCryptor.EncryptByte(var aValue: Byte);
var
  LTemp: Byte;
begin
  LTemp := CalcDecryptByte;
  UpdateKeys(aValue);
  aValue := aValue xor LTemp;
end;

function TCryptor.UpdateCRC32(aKey: LongWord; aValue: Byte): LongWord;
begin
  Result := (aKey shr 8) xor CRC32_TABLE[aValue xor (aKey and $000000FF)];
end;

procedure TCryptor.UpdateKeys(aValue: Byte);
begin
  FKey[0] := UpdateCRC32(FKey[0], aValue);
  FKey[1] := FKey[1] + (FKey[0] and $000000FF);
  FKey[1] := longword(FKey[1] * 134775813 + 1);
  FKey[2] := UpdateCRC32(FKey[2], Byte(FKey[1] shr 24));
end;

constructor TEncryptedZCompressionStream.Create(aTarget: TStream; const aPassword: string; const aZipHeader: TZipHeader);
begin
  inherited Create;

  FTarget := aTarget;
  FZipHeader := @aZipHeader;
  FPassword := aPassword;
end;

destructor TEncryptedZCompressionStream.Destroy;
begin
  EncryptToTarget;

  inherited;
end;

procedure TEncryptedZCompressionStream.EncryptToTarget;
var
  LCompressionStream: TStream;
  LEncryptStream: TStream;
begin
  ZipHeader.Flag := ZipHeader.Flag or 1;
  ZipHeader.CRC32 := crc32(0, Memory, Size);
  LEncryptStream := TEncryptStream.Create(Target, Password, ZipHeader^);
  try
    LCompressionStream := TZCompressionStream.Create(LEncryptStream, zcDefault, -15);
    try
      LCompressionStream.CopyFrom(Self, 0);
    finally
      LCompressionStream.Free;
    end;
  finally
    LEncryptStream.Free;
  end;
end;
{$ENDREGION}

type
  { TsfZipFile }
  TsfZipFile = class
  private type
    TOnBuildProgress = record
      Sender: Pointer;
      Handler: TsfZipFileBuildProgressEvent;
    end;
  private
    FPassword: string;
    FFilename: string;
    FFile: TEncryptedZipFile;
    FStream: TStream;
    FHeader: TZipHeader;
    FNewFileSize: Int64;
    FNewFile: Boolean;
    FOnBuildProgress: TOnBuildProgress;
    procedure OnZipProgress(Sender: TObject; FileName: string; Header: TZipHeader; Position: Int64);
  public
    property Stream: TStream read FStream;
    constructor Create; virtual;
    destructor Destroy; override;
    function Build(const APassword, AZipFilename, ADirectory: string; aSender: Pointer; aHandler: TsfZipFileBuildProgressEvent): Boolean;
    function Open(const APassword, AZipFilename, AFilename: string): PsfInputStream;
    class function Close(var AInputStream: PsfInputStream): Boolean;
  end;

{ InputStream Callbacks }
function sfInputStreamReadFunc(data: Pointer; size: sfInt64; userData: Pointer): sfInt64; cdecl;
var
  LZipFile: TsfZipFile;
begin
  LZipFile := userData;
  Result := LZipFile.Stream.Read(data^, size);
end;

function sfInputStreamSeekFunc(position: sfInt64; userData: Pointer): sfInt64; cdecl;
var
  LZipFile: TsfZipFile;
begin
  LZipFile := userData;
  Result := LZipFile.Stream.Seek(position, soBeginning);
end;

function sfInputStreamTellFunc(userData: Pointer): sfInt64; cdecl;
var
  LZipFile: TsfZipFile;
begin
  LZipFile := userData;
  Result := LZipFile.Stream.Position;
end;

function sfInputStreamGetSizeFunc(userData: Pointer): sfInt64; cdecl;
var
  LZipFile: TsfZipFile;
begin
  LZipFile := userData;
  Result := LZipFile.Stream.Size;
end;

{ TsfZipFile }
procedure TsfZipFile.OnZipProgress(Sender: TObject; FileName: string; Header: TZipHeader; Position: Int64);
var
  LProgress: Single;
begin
  LProgress := 100.0 * (Position / FNewFileSize);
  if Assigned(FOnBuildProgress.Handler) then
    FOnBuildProgress.Handler(FOnBuildProgress.Sender, Filename, Round(LProgress), FNewFile);
  if FNewFile  then
  begin
    FNewFile := False;
  end;
end;

constructor TsfZipFile.Create;
begin
  inherited;
end;

destructor TsfZipFile.Destroy;
begin
  if Assigned(FStream) then
    FStream.Free;
  if Assigned(FFile) then
  begin
    FFile.Close;
    FFile.Free;
  end;
  inherited;
end;

function TsfZipFile.Build(const APassword, AZipFilename, ADirectory: string; aSender: Pointer; aHandler: TsfZipFileBuildProgressEvent): Boolean;
var
  LFileList: TStringDynArray;
  LText: string;
  LFile: string;
  LZipFile: TEncryptedZipFile;
begin
  Result := False;

  if not TDirectory.Exists(ADirectory) then Exit;

  FOnBuildProgress.Sender := aSender;
  FOnBuildProgress.Handler := aHandler;

  LFileList := TDirectory.GetFiles(ADirectory, '*', TSearchOption.soAllDirectories);

  LZipFile := TEncryptedZipFile.Create(APassword);
  LZipFile.OnProgress := OnZipProgress;
  LZipFile.Open(AZipFilename, zmWrite);

  for LText in LFileList do
  begin
    LFile := LText.Replace('\', '/');
    FNewFileSize := TFile.GetSize(LText);
    FNewFile := True;
    LZipFile.Add(LFile, LFile);
  end;

  LZipFile.Close;
  FreeAndNil(LZipFile);

  Result := TFile.Exists(AZipFilename);

  FOnBuildProgress.Sender := nil;
  FOnBuildProgress.Handler := nil;
end;

function TsfZipFile.Open(const APassword, AZipFilename, AFilename: string): PsfInputStream;
begin
  Result := nil;
  if not TEncryptedZipFile.IsValid(AZipFilename) then Exit;
  FPassword := APassword;
  FFilename := AZipFilename;
  FFile := TEncryptedZipFile.Create(FPassword);
  FFile.Open(FFilename, zmRead);
  if FFile.Mode <> zmRead then
  begin
    FFile.Free;
    Exit;
  end;
  FFile.Read(AFilename, FStream, FHeader);
  if not Assigned(FStream) then
  begin
    FFile.Free;
    Exit;
  end;
  New(Result);
  if not Assigned(Result) then
  begin
    FFile.Free;
    Exit;
  end;
  Result.read := sfInputStreamReadFunc;
  Result.seek := sfInputStreamSeekFunc;
  Result.tell := sfInputStreamTellFunc;
  Result.getSize := sfInputStreamGetSizeFunc;
  Result.userData := Self;
end;

class function TsfZipFile.Close(var AInputStream: PsfInputStream): Boolean;
var
  LZipFile: TObject;
begin
  Result := False;
  if not Assigned(AInputStream) then Exit;
  LZipFile := AInputStream.userData;
  if LZipFile is TsfZipFile then
  begin
    LZipFile.Free;
    Dispose(AInputStream);
    AInputStream := nil;
    Result := True;
  end;
end;

{ sfZipFile }
function sfZipFile_build(const APassword, AZipFilename, ADirectory: string; const ASender: Pointer; const AHandler: TsfZipFileBuildProgressEvent): Boolean;
var
  LZipFile: TsfZipFile;
begin
  LZipFile := TsfZipFile.Create;
  Result := LZipFile.Build(APassword, AZipFilename, ADirectory, ASender, AHandler);
end;

function sfZipFile_open(const APassword, AZipFilename, AFilename: string): PsfInputStream;
var
  LZipFile: TsfZipFile;
begin
  LZipFile := TsfZipFile.Create;
  Result := LZipFile.Open(APassword, aZipFilename, aFilename);
end;

function sfZipFile_close(var AInputStream: PsfInputStream): Boolean;
begin
  Result := TsfZipFile.Close(AInputStream);
end;


end.
