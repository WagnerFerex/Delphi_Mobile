unit Instagram.View.First;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.StdCtrls, FMX.Controls.Presentation;

type
  TfrmInicial = class(TForm)
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Layout2: TLayout;
    Image1: TImage;
    Label1: TLabel;
    Layout3: TLayout;
    Layout4: TLayout;
    Layout5: TLayout;
    Layout6: TLayout;
    Layout7: TLayout;
    Rectangle2: TRectangle;
    SpeedButton1: TSpeedButton;
    Path1: TPath;
    Layout8: TLayout;
    Label2: TLabel;
    Line1: TLine;
    Line2: TLine;
    Label3: TLabel;
    Label4: TLabel;
    Rectangle3: TRectangle;
    procedure Label3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInicial: TfrmInicial;

implementation

{$R *.fmx}

uses Instagram.View.Login;

procedure TfrmInicial.Label3Click(Sender: TObject);
begin
  frmLogin := TfrmLogin.Create(Self);
  frmLogin.Show;
end;

end.
