<?php
// Ce fichier dois être mis dans typo3conf avec le nom "FaisToiPlaiz.php"
// Tu pourras override les valeurs ci-dessous

//Laisser 'db' car c'est le nom du service docker
$GLOBALS['TYPO3_CONF_VARS']['DB']['Connections']['Default']['host'] = 'db';

$GLOBALS['TYPO3_CONF_VARS']['DB']['Connections']['Default']['dbname'] = 'ton_nom_de_db';

$GLOBALS['TYPO3_CONF_VARS']['DB']['Connections']['Default']['password'] = 'ton_mdp_mysql';

$GLOBALS['TYPO3_CONF_VARS']['DB']['Connections']['Default']['user'] = 'ton_username_mysql';


// Le mot de passe est "pass"
$GLOBALS['TYPO3_CONF_VARS']['BE']['installToolPassword'] = '$argon2i$v=19$m=65536,t=16,p=1$cnlldzZVR0NRVFluSk9Tcg$z5BPatwP0y4LW9w1VBrsh6OZjAFe2rC69rSRhaJsifI';

 

$GLOBALS['TYPO3_CONF_VARS']['MAIL']['defaultMailFromAddress'] = "test-sender@e-magineurs.fr";

$GLOBALS['TYPO3_CONF_VARS']['MAIL']['defaultMailFromName'] = "Serveur local";

$GLOBALS['TYPO3_CONF_VARS']['SYS']['systemMaintainers'] = [1];

 

$GLOBALS['TYPO3_CONF_VARS']['BE']['debug'] = 1;

$GLOBALS['TYPO3_CONF_VARS']['FE']['debug'] = 1;

$GLOBALS['TYPO3_CONF_VARS']['SYS']['sqlDebug'] = 1;

$GLOBALS['TYPO3_CONF_VARS']['SYS']['displayErrors'] = 1;

$GLOBALS['TYPO3_CONF_VARS']['SYS']['systemLocale'] = 'fr_FR.UTF-8';