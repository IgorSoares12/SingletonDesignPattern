unit uSingleton;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  { TSingleton }

  TSingleton = class
    private
      constructor Create;
    public
      class function InstanceActive(var aPointer: TSingleton): Boolean;
      class function GetInstance: TSingleton;
      class function NewInstance: TObject; override;
  end;

implementation

var
   Instance: TSingleton;

class function TSingleton.NewInstance: TObject;
begin
  if not Assigned(Instance) then
     Instance := TSingleton(inherited NewInstance);

  Result := Instance;
end;

class function TSingleton.GetInstance: TSingleton;
begin
  Result := TSingleton.Create;
end;

constructor TSingleton.Create;
begin
  inherited;

end;

class function TSingleton.InstanceActive(var aPointer: TSingleton): Boolean;
begin
  Result := Assigned(aPointer);
end;

initialization

finalization
  FreeAndNil(Instance);

end.

