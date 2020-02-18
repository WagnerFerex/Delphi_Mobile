unit Instagram.View.Login;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Layouts, System.Actions,
  FMX.ActnList, FMX.TabControl, FMX.Edit;

type
  TfrmLogin = class(TForm)
    lytCadastro1: TLayout;
    lytHeader: TLayout;
    Rectangle1: TRectangle;
    Layout3: TLayout;
    Image1: TImage;
    Label1: TLabel;
    lytFacebook: TLayout;
    Layout7: TLayout;
    Rectangle2: TRectangle;
    SpeedButton1: TSpeedButton;
    Path1: TPath;
    rtgBackground: TRectangle;
    lytSpace1: TLayout;
    Layout8: TLayout;
    Label2: TLabel;
    Line1: TLine;
    Line2: TLine;
    Label3: TLabel;
    lytBottom: TLayout;
    Rectangle4: TRectangle;
    TabControl1: TTabControl;
    tbCadastro1: TTabItem;
    tbCadastro2: TTabItem;
    ActionList1: TActionList;
    acTabCadastro2: TChangeTabAction;
    tbCadastro3: TTabItem;
    tbLogin: TTabItem;
    acTabCadastro1: TChangeTabAction;
    acTabCadastro3: TChangeTabAction;
    acTabLogin: TChangeTabAction;
    Layout1: TLayout;
    Line3: TLine;
    Label5: TLabel;
    Layout2: TLayout;
    Label6: TLabel;
    Line4: TLine;
    Layout4: TLayout;
    Layout5: TLayout;
    Rectangle3: TRectangle;
    Label7: TLabel;
    Edit1: TEdit;
    Line5: TLine;
    Layout6: TLayout;
    Layout9: TLayout;
    Rectangle5: TRectangle;
    btnAvancar_Telefone: TSpeedButton;
    Layout10: TLayout;
    Layout11: TLayout;
    Label8: TLabel;
    Layout12: TLayout;
    Layout13: TLayout;
    Label9: TLabel;
    Label10: TLabel;
    Line6: TLine;
    Line7: TLine;
    Layout14: TLayout;
    Layout15: TLayout;
    Rectangle6: TRectangle;
    edtEmail: TEdit;
    Layout16: TLayout;
    Layout17: TLayout;
    Rectangle7: TRectangle;
    btnAvancar_Email: TSpeedButton;
    tbCadastroFoto: TTabItem;
    acTabCadastroFoto: TChangeTabAction;
    Layout18: TLayout;
    Circle1: TCircle;
    Layout20: TLayout;
    Label11: TLabel;
    Layout19: TLayout;
    Layout21: TLayout;
    Rectangle8: TRectangle;
    btnFinalizar: TSpeedButton;
    Layout22: TLayout;
    Layout23: TLayout;
    Layout24: TLayout;
    Rectangle9: TRectangle;
    Edit2: TEdit;
    Layout25: TLayout;
    Layout26: TLayout;
    Rectangle10: TRectangle;
    Edit3: TEdit;
    Layout28: TLayout;
    Layout29: TLayout;
    Label13: TLabel;
    Layout30: TLayout;
    Layout31: TLayout;
    Rectangle12: TRectangle;
    btnEntrar: TSpeedButton;
    Layout32: TLayout;
    Layout33: TLayout;
    Label14: TLabel;
    Line8: TLine;
    Line9: TLine;
    Layout34: TLayout;
    Layout35: TLayout;
    Label15: TLabel;
    Path2: TPath;
    Layout36: TLayout;
    Label4: TLabel;
    Label16: TLabel;
    Layout27: TLayout;
    Rectangle11: TRectangle;
    Layout37: TLayout;
    Label12: TLabel;
    Label17: TLabel;
    Layout38: TLayout;
    Rectangle13: TRectangle;
    Layout39: TLayout;
    Label18: TLabel;
    Label19: TLabel;
    Layout40: TLayout;
    Rectangle14: TRectangle;
    Layout41: TLayout;
    Label20: TLabel;
    Label21: TLabel;
    Layout42: TLayout;
    Rectangle15: TRectangle;
    Layout43: TLayout;
    Label22: TLabel;
    Label23: TLabel;
    Layout44: TLayout;
    Image2: TImage;
    procedure Label3Click(Sender: TObject);
    procedure btnAvancar_TelefoneClick(Sender: TObject);
    procedure btnAvancar_EmailClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label16Click(Sender: TObject);
    procedure Label17Click(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.fmx}

uses Instagram.View.Main;

procedure TfrmLogin.btnAvancar_EmailClick(Sender: TObject);
begin
  acTabCadastroFoto.ExecuteTarget(Sender);
end;

procedure TfrmLogin.btnAvancar_TelefoneClick(Sender: TObject);
begin
  acTabCadastro3.ExecuteTarget(Sender);
end;

procedure TfrmLogin.btnEntrarClick(Sender: TObject);
begin
  if not Assigned(frmMain) then
    frmMain := TfrmMain.Create(Self);

  frmMain.Show;
end;

procedure TfrmLogin.btnFinalizarClick(Sender: TObject);
begin
  acTabLogin.ExecuteTarget(Sender);
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  TabControl1.TabPosition := TTabPosition.None;
  TabControl1.ActiveTab := tbCadastro1;
end;

procedure TfrmLogin.Label16Click(Sender: TObject);
begin
  acTabLogin.ExecuteTarget(Sender);
end;

procedure TfrmLogin.Label17Click(Sender: TObject);
begin
  acTabCadastro1.ExecuteTarget(Sender);
end;

procedure TfrmLogin.Label3Click(Sender: TObject);
begin
  acTabCadastro2.ExecuteTarget(Sender);
end;

end.
