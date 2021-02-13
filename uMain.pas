unit uMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, uSingleton;

type

  { TMainForm }

  TMainForm = class(TForm)
    btnStatus: TButton;
    btnGetInstance: TButton;
    procedure btnGetInstanceClick(Sender: TObject);
    procedure btnStatusClick(Sender: TObject);
  private
    FSingleton: TSingleton;
    procedure VerifyInstance;
  public

  end;

var
  MainForm: TMainForm;

implementation

{$R *.lfm}

{ TMainForm }

procedure TMainForm.btnStatusClick(Sender: TObject);
begin
  VerifyInstance;
end;

procedure TMainForm.VerifyInstance;
begin
  if TSingleton.InstanceActive(FSingleton) then
    ShowMessage('Instance has active!')
  else
    ShowMessage('Instance no has active!')
end;

procedure TMainForm.btnGetInstanceClick(Sender: TObject);
begin
  FSingleton := TSingleton.GetInstance;
  VerifyInstance;
end;

end.

