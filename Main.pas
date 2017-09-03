unit Main;

// Install OpenSSL libraries and delete the IDOpenSSLSetLibPath-line below,
// or extract the dlls libeay32.dll and ssleay32.dll to project root.
// Add client certificate and key to project root as client.crt and client.key.
// Modify URL as needed for the service.

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfMain = class(TForm)
    bStart: TButton;
    mResult: TMemo;
    edIP: TEdit;
    Label1: TLabel;
    procedure bStartClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

{$R *.dfm}

uses IdHTTP, IdSSLOpenSSL, IdSSLOpenSSLHeaders;

procedure TfMain.bStartClick(Sender: TObject);
var
  S: TStringList;
  M: TStream;
  HTTP: TIdHTTP;
  IOHandler: TIdSSLIOHandlerSocketOpenSSL;
begin
  // Use OpenSSL libraries from project root
  IdSSLOpenSSLHeaders.IdOpenSSLSetLibPath(GetCurrentDir());
  S := TStringList.Create;
  M := TMemoryStream.Create;
  IOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(self);
  HTTP := TIdHTTP.Create(self);
  try
    // Set client cert and key for connection
    IOHandler.SSLOptions.CertFile := 'client.crt';
    IOHandler.SSLOptions.KeyFile := 'client.key';
    HTTP.IOHandler := IOHandler;
    try
      // Actual HTTP GET
      HTTP.Get(edIP.Text, M);
    except
      on E: Exception do
      begin
        mResult.Lines.Add('Error with connection: ' + E.Message)
      end;
    end;
    mResult.Lines.Add(Format('Response Code: %d', [HTTP.ResponseCode]));
    mResult.Lines.Add(Format('Response Text: %s', [HTTP.ResponseText]));

    M.Position := 0;
    S.LoadFromStream(M);
    mResult.Lines.AddStrings(S);
  finally
    S.Free;
    M.Free;
    IOHandler.Free;
    HTTP.Free;
  end;
end;

end.
