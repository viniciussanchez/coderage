program samples;

{$APPTYPE CONSOLE}

uses
  Horse,
  Horse.OctetStream,
  System.Classes,
  System.SysUtils;

{$R *.res}

begin
  THorse.Use(OctetStream);

  THorse.Get('pdf',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      LStream: TFileStream;
    begin
      LStream := TFileStream.Create('C:\Users\vinic\Downloads\coderage\octet-stream\horse.pdf', fmOpenRead);
      Res.Send(LStream);
    end);

  THorse.Post('pdf',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      Req.Body<TMemoryStream>.SaveToFile('C:\Users\vinic\Downloads\coderage\octet-stream\novo.pdf');
      Res.Status(THTTPStatus.NoContent);
    end);

  THorse.Listen;
end.
