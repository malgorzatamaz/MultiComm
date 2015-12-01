unit Contacts;

interface

type
TContact = record
    Id: Integer;
    Image: string;
    UserName: string;
    CallerId: string;
    OpenPage: Integer;
  end;

var
  gContacts: array of TContact;
implementation

end.
