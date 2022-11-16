<!DOCTYPE html>
<html lang="en">
<head>
    <title>{{pageTitle}}</title>

    <link rel="stylesheet" type="text/css" href="css/page-cards-print.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">

    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Bitter:ital,wght@0,400;0,500;0,700;1,400;1,500;1,700&display=swap">
</head>
<body class="page-background">
<div class="output-container" id="output-container">

    {{#each cardPages as |cardPage|}}

    <page class="page page-preview" size="Letter" style="background-color:white">
        <div class="page-card-inner">
            {{#each cardPage as |cardData|}}

                {{> (lookup cardData 'template') cardData}}
            {{/each}}
        </div>
    </page>
    {{/each}}
</div>
</body>
</html>
