<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Team2015.aspx.cs" Inherits="WebApplication5.Team2015" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <h1>Meet the Team!</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">


    <style>
        .normal {
            font-size: small;
        }

        .Name {
            font-weight: bold;
            font-size: large;
        }

        .auto-style1 {
            width: 53px;
            height: 23px;
        }

        .auto-style2 {
            height: 23px;
        }

        .coolbox {
            background-color: #1b1b1b;
            border: 10px solid #1b1b1b;
            margin-bottom: 20px;
            padding: 0;
        }

            .coolbox h1 {
                font-size: medium;
                color: #808080;
            }

        .auto-style3 {
            width: 30px;
        }

        .auto-style4 {
            width: 53px;
            height: 37px;
        }

        .auto-style5 {
            width: 30px;
            height: 37px;
        }

        .auto-style6 {
            height: 37px;
        }

        .box_header {
            font-family: 'Ubuntu', Helvetica, Arial, sans-serif;
            text-align: center;
            color: #808080;
            font-weight: 700;
            font-size: 15px;
    </style>


    <div class="span8">
        <div></div>
        <%--PRESIDENT--%>
        <div class="span9 offset1 left-justify">
            <table>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style5"></td>
                    <td class="auto-style6">&nbsp;<asp:Label Font-Bold="true" Font-Size="Larger" ID="lblPresident" runat="server" Text="President: Matt Chi"></asp:Label>
                        <script type="IN/MemberProfile" data-format="hover" data-id="https://www.linkedin.com/in/mattchi" data-related="false"></script>
                    </td>

                </tr>
                <tr>
                    <td>
                        <img class="img-polaroid" src="images/matt.jpg" height="200" width="100">
                    </td>
                    <td class="auto-style3"></td>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Matt is a 4th year undergraduate studying Computer Science. He is also an Army ROTC cadet, and will commission as a 2nd Lieutenant upon graduation. His background includes mobile programming for both iOS and Android, system administration, and project/team management. Currently he has no focus in information security but is looking more towards network security and systems administration, while having some understanding of other fields in security."></asp:Label>

                    </td>
                </tr>
            </table>


        </div>
        <%--Vice President--%>

        <div class="span9 offset1 left-justify">
            <table>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style5"></td>
                    <td class="auto-style6">&nbsp;<asp:Label Font-Bold="true" Font-Size="Larger" ID="Label12" runat="server" Text="Vice President: Calvin Nixon"></asp:Label>
                     <script type="IN/MemberProfile" data-id="https://www.linkedin.com/pub/calvin-nixon/35/18/3a0" data-format="hover"></script>
                    </td>

                </tr>
                <tr>
                    <td>
                          <img class="img-polaroid" src="images/Calvin.jpg" height="200" width="100">
                    </td>
                    <td class="auto-style3"></td>
                    <td>
                        <asp:Label ID="Label11" runat="server" Text="Going for this masters in Computer Science, Calvin joined the club to expand his experience in the field. He is one of the most honest and sincere guys in the club. If you need a friend, you can go to this guy."></asp:Label>

                    </td>
                </tr>
            </table>


        </div>


        <%--CTF LEAD--%>
        <div class="span9 offset1 left-justify">
            <table>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style5"></td>
                    <td class="auto-style6">&nbsp;<asp:Label Font-Bold="true" Font-Size="Larger" ID="Label1" runat="server" Text="CTF Lead: Dustin Tran"></asp:Label>
                         <script type="IN/MemberProfile" data-format="hover" data-id="http://www.linkedin.com/pub/dustin-tran/52/a0a/830" data-related="false"></script>
                        
                    </td>

                </tr>
                <tr>
                    <td>
                         <img class="img-polaroid" src="images/Dustin.jpeg" height="200" width="100">
                    </td>
                    <td class="auto-style3"></td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Dustin is a undergraduate student studying Software Engineering. He is currently interning at Cisco Systems, Inc. He works side by side with engineers on the ASR 9k routers. Outside of work and school, he enjoys spending a majority of his time studying security topics or gaming."></asp:Label>
               </td>
                </tr>
            </table>


        </div>

        <%--Treasurer--%>
        <div class="span9 offset1 left-justify">
            <table>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style5"></td>
                    <td class="auto-style6">&nbsp;<asp:Label Font-Bold="true" Font-Size="Larger" ID="Label6" runat="server" Text="Treasurer: Christine Le"></asp:Label>
                          <script type="IN/MemberProfile" data-id="ttps://www.linkedin.com/pub/christine-le/b5/ba3/634" data-format="hover"></script>
                    </td>

                </tr>
                <tr>
                    <td>
                        <img class="img-polaroid" src="images/Christine.jpeg" height="200" width="100">
                    </td>
                    <td class="auto-style3"></td>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="
                            Christine is a sophomore studying Computer Science. She is very resourceful and breaks the stereotype for female nerds. She wants to be a CTF God. She's also bubbly."
                            ></asp:Label>
                    </td>
                </tr>
            </table>


        </div>


        <%--Public Relations--%>
        <div class="span9 offset1 left-justify">
            <table>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style5"></td>
                    <td class="auto-style6">&nbsp;<asp:Label Font-Bold="true" Font-Size="Larger" ID="Label10" runat="server" Text="Director of Public Relations: Hansen Wu"></asp:Label>
                       <script type="IN/MemberProfile" data-id="https://www.linkedin.com/in/hansenwu" data-format="hover"></script>
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/GitHub-Mark-120px-plus.png" Height="16" Width="16" OnClick="GH_HANSEN" />

                    </td>

                </tr>
                <tr>
                    <td>
                        <img class="img-polaroid" src="images/Hansen.jpg" height="200" width="100">
                    </td>
                    <td class="auto-style3"></td>
                    <td>  <asp:Label ID="Label15" runat="server" Text="
                        Hansen Wu is an undergraduate student in his second year, and with junior course standing. He is majoring in CS and taking upper division courses. He is interested in all things computer with an emphasis on programming and networking. He has also set up an externally accessible Linux HTTP, FTP, and SSH server used to SOCKS proxy through school firewall for fun. Wielding Linux, the Internet, and a proxy server, nothing can stop him, excluding sleep, the feds, and his laptop battery.
                        "></asp:Label>
                    </td>
                </tr>
            </table>


        </div>

        <%--SECRETARY--%>
        <div class="span9 offset1 left-justify">
            <table>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style5"></td>
                    <td class="auto-style6">&nbsp;<asp:Label Font-Bold="true" Font-Size="Larger" ID="Label14" runat="server" Text="Secretary: Emily Dao"></asp:Label>
                        
                       
                    </td>

                </tr>
                <tr>
                    <td>
                        <img class="img-polaroid" src="images/Emily.jpeg" height="200" width="100">
                    </td>
                    <td class="auto-style3"></td>
                    <td>
                        <asp:Label ID="Label9" runat="server" Text="
Emily is a sophomore studying CS. She works hard to keep the club on track. At first sight, she seems shy, but she is actually really sweet once she opens up.
"></asp:Label>
                    </td>
                </tr>
            </table>


        </div>
         <%--CTF LEAD--%>
        <div class="span9 offset1 left-justify">
            <table>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style5"></td>
                    <td class="auto-style6">&nbsp;<asp:Label Font-Bold="true" Font-Size="Larger" ID="Label5" runat="server" Text="Web Administrator: Vivi Langga"></asp:Label>
                        <script type="IN/MemberProfile" data-format="hover" data-id="http://www.linkedin.com/in/vivilangga" data-related="false"></script>
                        <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/GitHub-Mark-120px-plus.png" Height="16" Width="16" OnClick="GH_ANTHONY" />
                    </td>

                </tr>
                <tr>
                    <td>
                        <img class="img-polaroid" src="images/Vivi.jpg" height="200" width="100">
                    </td>
                    <td class="auto-style3"></td>
                    <td>
                        <asp:Label ID="Label13" runat="server" Text="Vivi Langga is graduating in CS this Spring. She is the current Web Developer and Web Admin for the club. Her main skills are mainly backend Web Developement, Memory Forensics, Web Pen Testing, and Python scripting although her current interests include Reverse Engineering and Cryptography. She likes to practice her Social Engineering Skills so don't get confused if you know her by a different name and background."></asp:Label>
                    </td>
                </tr>
            </table>


        </div>


    </div>
    <div class="span2">

        <div class="coolbox">
            <h1 class="">The Other Years</h1>
            <ul>
                 <li><a href="Team2015.aspx">~ Class of 2015</a>
                </li>
                <li><a href="Team2014.aspx">~ Class of 2014</a>
                </li>
                <li><a href="Team2013.aspx">~ Class of 2013</a>
                </li>
            </ul>
        </div>

        <div class="coolbox">
            <asp:Label runat="server" class="box_header">Meet sure to check out our Advisors</asp:Label>
            <br />
            <br />
            <ul>
                <li><a href="Advisors.aspx">The people the club couldn't be without</a>
                </li>

            </ul>
        </div>
    </div>

</asp:Content>
