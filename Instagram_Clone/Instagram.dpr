program Instagram;

uses
  System.StartUpCopy,
  FMX.Forms,
  Instagram.View.First in 'Instagram.View.First.pas' {frmInicial},
  Instagram.View.Login in 'Instagram.View.Login.pas' {frmLogin},
  Instagram.View.Main in 'Instagram.View.Main.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
