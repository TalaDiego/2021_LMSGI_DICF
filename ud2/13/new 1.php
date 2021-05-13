<?php 



include_once 'config/DBConfig.php'; 



class DBPDO 

{ 

    public static function ejecutarConsulta($consultaSQL, $parametros) 

    { 

        try { 

            $miBD = new PDO(DSN, USUARIO, PASSWORD); 

            $miBD->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); 

            $preparedStatement = $miBD->prepare($consultaSQL); 

            $preparedStatement->execute($parametros); 



        } catch (PDOException $pdoe) { 

            $preparedStatement = null; 

            unset($miBD); 

        } 

        return $preparedStatement; 

    } 

} 

?> 