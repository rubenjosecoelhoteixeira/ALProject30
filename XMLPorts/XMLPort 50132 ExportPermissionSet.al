xmlport 50132 ExportPermissionSet
{
    Format = Xml;

    schema
    {
        textelement(PermissionSets)
        {
            tableelement(PSet; "Aggregate Permission Set")
            {
                SourceTableView = where("App Name" = filter(<> ''));
                XmlName = 'PermissionSet';
                fieldattribute(RoleID; PSet."Role ID") { }
                fieldattribute(RoleName; PSet.Name) { }
                tableelement(P; "Tenant Permission")
                {
                    XmlName = 'Permission';
                    LinkTable = pset;
                    LinkFields = "Role ID" = field("Role ID");

                    textelement(ObjectType)
                    {
                        trigger onbeforePassVariable();
                        var
                            int: Integer;
                        begin
                            int := p."Object Type";
                            ObjectType := Format(int);
                        end;
                    }
                    textelement(ObjectID)
                    {
                        trigger onbeforePassVariable();
                        var
                            int: Integer;
                        begin
                            int := p."Object ID";
                            ObjectID := Format(int);
                        end;
                    }
                    textelement(ReadPermission)
                    {
                        trigger onbeforePassVariable();
                        var
                            int: Integer;
                        begin
                            int := p."Read Permission";
                            ReadPermission := Format(int);
                        end;
                    }
                    textelement(InsertPermission)
                    {
                        trigger onbeforePassVariable();
                        var
                            int: Integer;
                        begin
                            int := p."Insert Permission";
                            InsertPermission := Format(int);
                        end;
                    }
                    textelement(ModifyPermission)
                    {
                        trigger onbeforePassVariable();
                        var
                            int: Integer;
                        begin
                            int := p."Modify Permission";
                            ModifyPermission := Format(int);
                        end;
                    }
                    textelement(DeletePermission)
                    {
                        trigger onbeforePassVariable();
                        var
                            int: Integer;
                        begin
                            int := p."Delete Permission";
                            DeletePermission := Format(int);
                        end;
                    }
                    textelement(ExecutePermission)
                    {
                        trigger onbeforePassvariable();
                        var
                            int: Integer;
                        begin
                            int := p."Execute Permission";
                            ExecutePermission := Format(int);
                        end;
                    }
                    textelement(SecurityFilter)
                    {
                        trigger onbeforePassvariable();
                        begin
                            SecurityFilter := Format(p."Security Filter");
                        end;
                    }

                }
            }
        }
    }
}