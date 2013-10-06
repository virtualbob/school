<!DOCTYPE HTML PUBLIC
  "-//W3C//DTD HTML 4.01 Transitional//EN"
  "http://www.w3.org/TR/html401/loose.dtd">
<html>
    <head>
    <title>Passing variables to a function by value or by reference</title>
  </head>
  <body>
  <table border='1'>
    <tr>
      <th>
        Step
      </th>
      <th>
        Variable Value
      </th>
    </tr>
    <?php
    // Set initial value for the variable
    $Variable=110;

    // Display the initial variable value.
    echo "<tr>
          <td>Initial value</td>
          <td align='right'>$Variable</td>
        </tr>";

    // Pass the variable by value to the AddNineteen_value() function.
    AddNineteen_value($Variable);

    // Display the variable value after passing it by value.
    echo "<tr>
          <td>After passing by value</td>
          <td align='right'>$Variable</td>
        </tr>";

    // Pass the variable by reference to the AddNineteen_reference() function.
    AddNineteen_reference($Variable);

    // Display the variable value after passing it by reference.
    echo "<tr>
          <td>After passing by reference</td>
          <td align='right'>$Variable</td>
        </tr>";

    // Function to add 19 to the received variable;
    // the function receives the variable value.
    function AddNineteen_value($MyVariable)
    {
      $MyVariable+=19;
    }

    // Function to add 19 to the received variable;
    // the function receives a reference to the variable
    // (note the ampersand before the variable name).
    function AddNineteen_reference(&$MyVariable)
    {
      $MyVariable+=19;
    }
    ?>
    </table>
  </body>
</html>
