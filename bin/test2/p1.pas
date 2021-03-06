﻿program p1;

(*
procedure test(a: Integer);
begin
end;

procedure test_safecall(a: Integer); safecall;
begin
end;

function test_safecall2(a: Integer): Integer; safecall;
begin
end;
*)

type
	tmyobj = class
	public
		constructor Create;
		procedure test;
		procedure test_virtual; virtual;
		procedure test_virtual2; virtual;
		class procedure classProc;
	end;
	
	tobj2 = object
	public
		procedure test;
	end;
	
	TMethPtr = procedure (Value: Integer) of object;

constructor tmyobj.Create;
begin
end;

procedure tmyobj.test;
begin
end;

procedure tmyobj.test_virtual; 
begin
end;

procedure tmyobj.test_virtual2; 
begin
end;

class procedure tmyobj.classProc;
begin
end;

procedure tobj2.test;
begin
end;
(*
function test_meth2: tmyobj;
begin
	result := tmyobj.create;
end;
*)

const
	Sss1: AnsiString  = 'llvm';
	Sss2: UnicodeString = '撸撸威猛';
	
procedure test_meth(a: tmyobj; const b: tobj2; c: TMethPtr);
begin
	a.test_virtual;
	a.test_virtual2;
	TMyObj.classProc;
	a.classProc;
	a.test;
	b.test;
	c(2);
end;

procedure test_cast(Instance: pointer; Offset: Integer);
begin
	PInteger(@PChar(Instance)[Offset])^ := 0;
end;

type
	TMyArr = array[0..5] of Integer;
	TMyEvent = procedure (Value: Integer) of object;
	TMySet = set of 1..40;

function test_spec_type(a: byte): TMySet;
begin
end;

function test_spec_type2(a: byte): TMyEvent;
begin
end;

function test_arg1(a: Integer): Integer;
begin
{$r+,q+}
	result := a + 1;
{$r-}
{$q-}
end;

function test_arg2(var i: Integer): TMyArr;
begin
	Result[0] := i;
end;

procedure test_a(const a:tmyarr; var b:tmyarr; c: tmyarr);
begin
	b[1] := a[1];
	b[0] := c[0];
end;

function test_nest(var a: Integer; b: byte): Integer;

  procedure nest1;
  begin
	a := b;
  end;

var
	zz: Integer;
	
  procedure nest2(yy: word);

    procedure nest2_1;
    begin
      nest1;
    end;
  begin
    nest2_1;
	a := b + zz * yy;
  end;

begin
	zz := 2;
	nest1;
	nest2(5);
	result := zz;
end;

type
	TMyProc = procedure (var a: Integer);

procedure test_myproc(pp: TMyProc; a: Integer);
begin
	pp(a);
end;

var
	hh: Integer;

begin
	test_arg1(1);
//	test_arg2(hh);
	test_nest(hh, 8);
//	test(2);
//	test_safecall(2);
//	test_safecall2(3);
end.