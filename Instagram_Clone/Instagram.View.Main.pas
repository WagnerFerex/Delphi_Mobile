unit Instagram.View.Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.TabControl, FMX.Objects, System.Actions, FMX.ActnList, FMX.Gestures,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, Soap.EncdDecd;

type
  TfrmMain = class(TForm)
    Layout1: TLayout;
    TabControl1: TTabControl;
    tbCamera: TTabItem;
    tbTimeLine: TTabItem;
    tbMensagem: TTabItem;
    Layout2: TLayout;
    lytAbas: TLayout;
    lytAba_home: TLayout;
    Image1: TImage;
    Layout3: TLayout;
    Image2: TImage;
    Layout4: TLayout;
    Image3: TImage;
    Layout5: TLayout;
    Image4: TImage;
    Layout6: TLayout;
    Image5: TImage;
    Rectangle1: TRectangle;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    GestureManager: TGestureManager;
    ActionList: TActionList;
    acTabLeft: TChangeTabAction;
    acTabRight: TChangeTabAction;
    ListView: TListView;
    img_icone_like2: TImage;
    img_icone_comentario: TImage;
    img_icone_like: TImage;
    img_foto: TImage;
    img_icone_enviar: TImage;
    img_icone_marcar: TImage;
    img_icone_opcoes: TImage;
    img_icone_marcar2: TImage;
    img_mascara: TImage;
    img_avatar: TImage;
    procedure FormCreate(Sender: TObject);
    procedure acTabLeftUpdate(Sender: TObject);
    procedure acTabRightUpdate(Sender: TObject);
    procedure ListViewUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure ListViewItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
  private
    { Private declarations }

    procedure AddFoto(icone_usuario_64, nome_usuario, localizacao, foto64, descricao : string; qtdCurtida : integer);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

function Base64FromBitmap(Bitmap: TBitmap): string;
var
  Input: TBytesStream;
  Output: TStringStream;

begin
  Input := TBytesStream.Create;
  try
    Bitmap.SaveToStream(Input);
    Input.Position := 0;
    Output := TStringStream.Create('', TEncoding.ASCII);

    try
      Soap.EncdDecd.EncodeStream(Input, Output);
      Result := Output.DataString;
    finally
      Output.Free;
    end;

  finally
    Input.Free;
  end;
end;

function BitmapFromBase64(const base64: string): TBitmap;
var
  Input: TStringStream;
  Output: TBytesStream;
begin
  Input := TStringStream.Create(base64, TEncoding.ASCII);
  try
    Output := TBytesStream.Create;
    try
      Soap.EncdDecd.DecodeStream(Input, Output);
      Output.Position := 0;
      Result := TBitmap.Create;
      try
        Result.LoadFromStream(Output);
      except
        Result.Free;
        raise;
      end;
    finally
      Output.Free;
    end;
  finally
    Input.Free;
  end;
end;

procedure TfrmMain.acTabLeftUpdate(Sender: TObject);
begin
  if TabControl1.ActiveTab = tbMensagem then
    acTabLeft.Tab := nil
  else
  begin

    if TabControl1.ActiveTab = tbCamera then
      acTabLeft.Tab := tbTimeLine

    else
      acTabLeft.Tab := tbMensagem;

  end;
end;

procedure TfrmMain.acTabRightUpdate(Sender: TObject);
begin
  if TabControl1.ActiveTab = tbCamera then
    acTabLeft.Tab := nil
  else
  begin

    if TabControl1.ActiveTab = tbMensagem then
      acTabRight.Tab := tbTimeLine

    else
      acTabRight.Tab := tbCamera;

  end;
end;

procedure TfrmMain.AddFoto(icone_usuario_64, nome_usuario, localizacao, foto64,
  descricao: string; qtdCurtida: integer);
var
  Item: TListViewItem;
  txt: TListItemText;
  img: TListItemImage;

begin
  Item :=  ListView.Items.Add;

  { nome do usuário }
  txt := TListItemText(Item.Objects.FindDrawable('Text1'));
  txt.Text := nome_usuario;
  txt.Font.Size := 11;
  txt.Font.Style := [TFontStyle.fsBold];

  { localizacao }
  txt := TListItemText(Item.Objects.FindDrawable('Text2'));
  txt.Text := localizacao;
  txt.Font.Size := 11;

  { foto opcoes }
  img := TListItemImage(Item.Objects.FindDrawable('Image4'));
  img.Bitmap := img_icone_opcoes.Bitmap;

  { avatar }
  img := TListItemImage(Item.Objects.FindDrawable('Image3'));
  img.Bitmap := img_avatar.Bitmap;

  { foto }
  img := TListItemImage(Item.Objects.FindDrawable('Image5'));
  img.Bitmap := img_foto.Bitmap;

  {foto mascara}
  img := TListItemImage(Item.Objects.FindDrawable('Image12'));
  img.Bitmap := img_mascara.Bitmap;

  { foto like }
  img := TListItemImage(Item.Objects.FindDrawable('Image6'));
  img.Bitmap := img_icone_like.Bitmap;

  { foto comentario }
  img := TListItemImage(Item.Objects.FindDrawable('Image7'));
  img.Bitmap := img_icone_comentario.Bitmap;

  { foto mensagens }
  img := TListItemImage(Item.Objects.FindDrawable('Image8'));
  img.Bitmap := img_icone_enviar.Bitmap;

  { foto salvar }
  img := TListItemImage(Item.Objects.FindDrawable('Image9'));
  img.Bitmap := img_icone_marcar.Bitmap;

  { qtd. curtidas }
  txt := TListItemText(Item.Objects.FindDrawable('Text10'));
  txt.Font.Size := 11;

  case qtdCurtida of
    0: txt.Text := 'Nenhuma curtida';
    1: txt.Text := 'Curtido por uma pessoa';
    else
      txt.Text := 'Curtido por '+ IntToStr(qtdCurtida) + ' pessoas';
  end;

  { Descricao da foto }
  txt := TListItemText(Item.Objects.FindDrawable('Text11'));
  txt.Font.Size := 11;
  txt.Text := descricao;
  txt.WordWrap := True;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  TabControl1.TabPosition := TTabPosition.None;
  TabControl1.ActiveTab := tbTimeLine;

  img_icone_like.Visible := False;
  img_icone_like2.Visible := False;
  img_icone_comentario.Visible := False;
  img_icone_enviar.Visible := False;
  img_icone_marcar.Visible := False;
  img_icone_marcar2.Visible := False;
  img_icone_opcoes.Visible := False;
  img_foto.Visible := False;
  img_mascara.Visible := False;
  img_avatar.Visible := False;

  AddFoto('', 'Wagner Vasconcelos', 'Muriaé', '', 'Teste de descrição para a foto.', 37);
end;

procedure TfrmMain.ListViewItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
  if TListView(Sender).Selected <> nil then
  begin
    if ItemObject is TListItemImage then
    begin

      if TListItemImage(ItemObject).Name = 'image6' then
      begin

        if TListItemImage(ItemObject).TagFloat = 0 then
        begin
          TListItemImage(ItemObject).Bitmap := img_icone_like2.Bitmap;
          TListItemImage(ItemObject).TagFloat := 1;
        end
        else
        begin
          TListItemImage(ItemObject).Bitmap := img_icone_like2.Bitmap;
          TListItemImage(ItemObject).TagFloat := 1;
        end;

      end;
    end;
  end;
end;

procedure TfrmMain.ListViewUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);

var
  img: TListItemImage;
  img_Icone: TListItemImage;
  txt: TListItemText;

begin

  { foto opcoes }
  img := TListItemImage(AItem.Objects.FindDrawable('Image5'));
  img.Width := frmMain.Width;
  img.Height := img.Width;

  { foto like }
  img_Icone := TListItemImage(AItem.Objects.FindDrawable('Image6'));
  img_Icone.Bitmap := img_icone_like.Bitmap;
  img_Icone.PlaceOffset.Y := Trunc(img.PlaceOffset.Y + img.Height + 2);

  { foto comentario }
  img_Icone := TListItemImage(AItem.Objects.FindDrawable('Image7'));
  img_Icone.Bitmap := img_icone_comentario.Bitmap;
  img_Icone.PlaceOffset.Y := Trunc(img.PlaceOffset.Y + img.Height + 2);

  { foto mensagens }
  img_Icone := TListItemImage(AItem.Objects.FindDrawable('Image8'));
  img_Icone.Bitmap := img_icone_enviar.Bitmap;
  img_Icone.PlaceOffset.Y := Trunc(img.PlaceOffset.Y + img.Height + 2);

  { foto salvar }
  img_Icone := TListItemImage(AItem.Objects.FindDrawable('Image9'));
  img_Icone.Bitmap := img_icone_marcar.Bitmap;
  img_Icone.PlaceOffset.Y := Trunc(img.PlaceOffset.Y + img.Height + 2);

  { qtd. curtidas }
  txt := TListItemText(AItem.Objects.FindDrawable('Text10'));
  txt.PlaceOffset.Y := Trunc(img.PlaceOffset.Y + img.Height + 42);


  { descricao }
  txt := TListItemText(AItem.Objects.FindDrawable('Text11'));
  txt.PlaceOffset.Y := Trunc(img.PlaceOffset.Y + img.Height + 62);


  AItem.Height := Trunc(img.PlaceOffset.Y + img.Height + 92);
end;

end.
