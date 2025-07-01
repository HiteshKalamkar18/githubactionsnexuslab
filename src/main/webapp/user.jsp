<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>E-Commerce Site</title>
  <style>
    label {
      display: inline-block;
      width: 100px;
      font-weight: bold;
    }
    .required {
      color: red;
    }
    table {
      width: 100%;
      max-width: 750px;
    }
    input[type="text"] {
      width: 200px;
    }
  </style>
  <script>
    function validate(form) {
      const requiredFields = [
        { name: "firstName", label: "First Name" },
        { name: "lastName", label: "Last Name" },
        { name: "emailAddress", label: "Email Address" },
        { name: "address1", label: "Address Line 1" },
        { name: "city", label: "City" },
        { name: "state", label: "State" },
        { name: "pin", label: "Pin Code" },
        { name: "country", label: "Country" }
      ];

      for (const field of requiredFields) {
        if (form[field.name].value.trim() === "") {
          alert("Please fill in your " + field.label);
          form[field.name].focus();
          return false;
        }
      }

      form.submit();
    }
  </script>
</head>

<body bgcolor="#FFFFFF" text="#000000">
  <table cellpadding="6" border="0">
    <tr>
      <td colspan="2">
        <jsp:include page="header.jsp" flush="true" />
      </td>
    </tr>
    <tr>
      <td valign="top">
        <jsp:include page="menu.jsp" flush="true" />
      </td>
      <td valign="top">
        <h1>Enter your name and contact information</h1>
        <form action="adduser.jsp" method="post">
          <table border="0" cellpadding="5">
            <tr>
              <td></td>
              <td><p>Required <span class="required">*</span></p></td>
            </tr>

            <tr>
              <td><label for="firstName">First Name</label></td>
              <td>
                <input type="text" name="firstName" id="firstName" required>
                <span class="required">*</span>
              </td>
            </tr>

            <tr>
              <td><label for="lastName">Last Name</label></td>
              <td>
                <input type="text" name="lastName" id="lastName" required>
                <span class="required">*</span>
              </td>
            </tr>

            <tr>
              <td><label for="emailAddress">Email Address</label></td>
              <td>
                <input type="text" name="emailAddress" id="emailAddress" required>
                <span class="required">*</span>
              </td>
            </tr>

            <tr>
              <td><label for="companyName">Company</label></td>
              <td><input type="text" name="companyName" id="companyName"></td>
            </tr>

            <tr>
              <td><label for="address1">Address1</label></td>
              <td>
                <input type="text" name="address1" id="address1" required>
                <span class="required">*</span>
              </td>
            </tr>

            <tr>
              <td><label for="address2">Address2</label></td>
              <td><input type="text" name="address2" id="address2"></td>
            </tr>

            <tr>
              <td><label for="city">City</label></td>
              <td>
                <input type="text" name="city" id="city" required>
                <span class="required">*</span>
              </td>
            </tr>

            <tr>
              <td><label for="state">State</label></td>
              <td>
                <input type="text" name="state" id="state" required>
                <span class="required">*</span>
              </td>
            </tr>

            <tr>
              <td><label for="pin">Pin Code</label></td>
              <td>
                <input type="text" name="pin" id="pin" required>
                <span class="required">*</span>
              </td>
            </tr>

            <tr>
              <td><label for="country">Country</label></td>
              <td>
                <input type="text" name="country" id="country" required>
                <span class="required">*</span>
              </td>
            </tr>

            <tr>
              <td></td>
              <td>
                <input type="button" value="Save" onclick="validate(this.form)">
              </td>
            </tr>
          </table>
        </form>
      </td>
    </tr>
  </table>
</body>
</html>
