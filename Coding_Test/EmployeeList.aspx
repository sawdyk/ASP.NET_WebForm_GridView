<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="EmployeeList.aspx.cs" Inherits="Coding_Test.EmployeeList" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <br />
    <asp:Label ID="lblAddEmployee" Font-Size="Large" runat="server" Visible="true" ForeColor="Black" Text="ADD NEW EMPLOYEE"></asp:Label>
    <br />
    <br />
    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
    <asp:Label ID="lblErrorMsg" runat="server" Text=""></asp:Label>
    <div class="row">
        <div class="col-md-4">
            <label class="form-control-label">FirstName:<span class="text-danger ml-2">*</span></label>
            <asp:TextBox runat="server" ID="txtFirstName" class="form-control" placeholder="FirstName"></asp:TextBox>
        </div>
        <div class="col-md-4">
            <label class="form-control-label">LastName:<span class="text-danger ml-2">*</span></label>
            <asp:TextBox runat="server" ID="txtLastName" class="form-control" placeholder="LastName"></asp:TextBox>
        </div>
        <div class="col-md-4">
            <label class="form-control-label">Home_Address:<span class="text-danger ml-2">*</span></label>
            <asp:TextBox runat="server" ID="txtHomeAddress" class="form-control" placeholder="HomeAddress"></asp:TextBox>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-4">
            <label class="form-control-label">EmailAddress:<span class="text-danger ml-2">*</span></label>
            <asp:TextBox runat="server" ID="txtEmailAddress" class="form-control" placeholder="EmailAddress"></asp:TextBox>
        </div>
        <div class="col-md-4">
            <label class="form-control-label">PhoneNumber:<span class="text-danger ml-2">*</span></label>
            <asp:TextBox runat="server" ID="txtPhoneNumber" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);" class="form-control" MaxLength="11" placeholder="PhoneNumber"></asp:TextBox>
        </div>
        <div class="col-md-4">
            <label class="form-control-label">Position:<span class="text-danger ml-2">*</span></label>
            <asp:TextBox runat="server" ID="txtPosition" class="form-control" placeholder="Position"></asp:TextBox>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-4">
            <label class="form-control-label">Salary:<span class="text-danger ml-2">*</span></label>
            <asp:TextBox runat="server" ID="txtSalary" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);" class="form-control" placeholder="Salary"></asp:TextBox>
        </div>
        <div class="col-md-4">
            <br />
            <asp:Button ID="Button1" class="btn btn-primary" OnClick="btnSave_Click" runat="server" Text="Add Employee" />
        </div>
         <div class="col-md-4">
            <br />
            <asp:Button ID="Button2" class="btn btn-primary" OnClick="btnClear_Click" runat="server" Text="Clear Entries" />
        </div>
    </div>
    <br />
    <br />
    <asp:Label ID="lblEmployee" Font-Size="Large" runat="server" Visible="true" ForeColor="Black" Text="ALL EMPLOYEES"></asp:Label>
    <br />
    <br />

    <asp:Panel ID="Panel2" Width="1000%" class="table table-striped" ScrollBars="Horizontal" runat="server">
        <asp:GridView ID="EmployeeGridView" Width="1000%" runat="server" AutoGenerateColumns="False" ShowFooter="True" AllowPaging="True" AllowSorting="True" class="table table-striped"
            CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCancelingEdit="EmployeeGridView_RowCancelingEdit" PageSize="20" OnPageIndexChanging="EmployeeGridView_PageIndexChanging"
            OnRowUpdating="EmployeeGridView_RowUpdating" OnRowEditing="EmployeeGridView_RowEditing" OnRowDeleting="EmployeeGridView_RowDeleting">
            <AlternatingRowStyle BackColor="White" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#3366ff" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
            <Columns>
                <asp:TemplateField HeaderText=" S/N">
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="FirstName">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtFirstName" class="form-control" Text='<%# Eval("First_Name")  %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblFirstName" Text='<%# Eval("First_Name")  %>' runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="LastName">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtLastName" class="form-control" Text='<%# Eval("Last_Name")  %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblLastName" Text='<%# Eval("Last_Name")  %>' runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="HomeAddress">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtHomeAddress" class="form-control" Text='<%# Eval("Home_Address") %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblHomeAddress" Text='<%# Eval("Home_Address")  %>' runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="EmailAddress">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEmailAddress" class="form-control" Text='<%# Eval("Email_Address") %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblEmailAddress" Text='<%# Eval("Email_Address")  %>' runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PhoneNumber">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtPhoneNumber" class="form-control" Text='<%# Eval("Phone_Number") %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblPhoneNumber" Text='<%# Eval("Phone_Number")  %>' runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Position">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtPosition" class="form-control" Text='<%# Eval("Position") %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblPosition" Text='<%# Eval("Position")  %>' runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Salary">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtSalary" class="form-control" Text='<%# Eval("Salary") %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblSalary" Text='<%# Eval("Salary")  %>' runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ID" Visible="False">
                    <ItemTemplate>
                        <asp:Label ID="lblId" Text='<%# Eval("Id")  %>' runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="True" HeaderStyle-Width="15%">
                    <EditItemTemplate>
                        <asp:LinkButton ID="lnkUpdate" runat="server" CommandArgument='<%# Eval("Id")  %>' CausesValidation="true" CommandName="Update" Text="Update" ToolTip="Update" class="btn btn-primary">Update</asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="lnkCancel" runat="server" CommandArgument='<%# Eval("Id")  %>' CausesValidation="False" CommandName="Cancel" Text="Cancel" ToolTip="Cancel" class="btn btn-primary">Cancel</asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkEdit" CommandArgument='<%# Eval("Id") %>' runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" ToolTip="Edit" class="btn btn-primary" >Edit</asp:LinkButton>
                        <asp:LinkButton ID="lnkDelete" OnClientClick="javascript:return confirm('Are you sure you want to delete this Employee?');" runat="server" CommandArgument='<%# Eval("Id")  %>' CausesValidation="true"  CommandName="Delete" Text="Delete" ToolTip="Delete" class="btn btn-primary">Delete</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerSettings FirstPageText="First Page"
                LastPageText="Last Page" Mode="NextPreviousFirstLast"
                NextPageText="Next" PreviousPageText="Previous" />
        </asp:GridView>
    </asp:Panel>
</asp:Content>

