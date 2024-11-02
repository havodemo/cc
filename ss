<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>Payment for John Roberts Bookstore</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css" />

    <!-- jQuery and Bootstrap JS -->
    <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
    <p><br><br><br><br><br><br></p>

<div class="container">
    <!-- Credit Card Payment Form - START -->
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-md-4 col-md-offset-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="row">
                            <h3 class="text-center">Payment Details</h3>
                            <img class="img-responsive cc-img" src="http://www.prepbootstrap.com/Content/images/shared/misc/creditcardicons.png" alt="Credit Card Icons">
                        </div>
                    </div>
                    <div class="panel-body">
                        <!-- Payment Form -->
                        <form role="form" action="process_payment.php" method="POST" id="payment-form">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="form-group">
                                        <label for="cardNumber">CARD NUMBER</label>
                                        <div class="input-group">
                                            <input type="tel" class="form-control" id="cardNumber" name="cardNumber" placeholder="Valid Card Number" required autofocus maxlength="19" />
                                            <span class="input-group-addon"><span class="fa fa-credit-card"></span></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        
                            <div class="row">
                                <div class="col-xs-7 col-md-7">
                                    <div class="form-group">
                                        <label for="expDate">EXPIRATION DATE</label>
                                        <input type="tel" class="form-control" id="expDate" name="expDate" placeholder="MM / YY" required maxlength="5" />
                                    </div>
                                </div>
                                <div class="col-xs-5 col-md-5 pull-right">
                                    <div class="form-group">
                                        <label for="cvCode">CV CODE</label>
                                        <input type="tel" class="form-control" id="cvCode" name="cvCode" placeholder="CVC" required maxlength="4" />
                                    </div>
                                </div>
                            </div>
                        
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="form-group">
                                        <label for="cardOwner">CARD OWNER</label>
                                        <input type="text" class="form-control" id="cardOwner" name="cardOwner" placeholder="Card Owner Name" required />
                                    </div>
                                </div>
                            </div>
                        
                            <div class="row">
                                <div class="col-xs-12">
                                    <button type="submit" class="btn btn-warning btn-lg btn-block">Process Payment</button>
                                </div>
                            </div>
                        </form>
                        
                    </div>
                  
                </div>
            </div>
        </div>
    </div>

    <style>
        .cc-img {
            margin: 0 auto;
        }
    </style>
    <!-- Credit Card Payment Form - END -->
</div>

<script>
    // Format card number into groups of 4 and restrict to numbers
    $(document).ready(function () {
        $('#cardNumber').on('input', function () {
            let input = $(this).val().replace(/\D/g, ''); // Remove non-numeric characters
            input = input.substring(0, 16); // Limit to 16 digits

            // Add space after every 4 digits
            input = input.replace(/(\d{4})(?=\d)/g, '$1 ');

            $(this).val(input);
        });

        // Format expiration date (MM / YY) and restrict to numbers
        $('#expDate').on('input', function () {
            let input = $(this).val().replace(/\D/g, ''); // Remove non-numeric characters
            input = input.substring(0, 4); // Limit to 4 digits (MMYY)

            // Add slash after 2 digits (MM)
            if (input.length >= 2) {
                input = input.substring(0, 2) + '/' + input.substring(2);
            }

            $(this).val(input);
        });

        // Restrict CV code input to 4 digits and numbers only
        $('#cvCode').on('input', function () {
            let input = $(this).val().replace(/\D/g, ''); // Remove non-numeric characters
            input = input.substring(0, 4); // Limit to 4 digits
            $(this).val(input);
        });

        // Basic form validation for demonstration purposes
        $('#payment-form').on('submit', function (e) {
            const cardNumber = $('#cardNumber').val().replace(/\s+/g, ''); // Remove spaces for validation
            const expDate = $('#expDate').val();
            const cvCode = $('#cvCode').val();

            if (cardNumber.length < 16 || !/^\d+$/.test(cardNumber)) {
                alert('Please enter a valid card number.');
                e.preventDefault();
                return;
            }

            if (!/^(0[1-9]|1[0-2])\/?([0-9]{2})$/.test(expDate)) {
                alert('Please enter a valid expiration date (MM/YY).');
                e.preventDefault();
                return;
            }

            if (cvCode.length < 3 || !/^\d+$/.test(cvCode)) {
                alert('Please enter a valid CVC.');
                e.preventDefault();
                return;
            }
        });
    });
</script>

</body>
</html>