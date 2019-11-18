UPDATE `fc_anti_bl`.`clientes` SET `tipo_persona`='1' WHERE `tipo_persona` IS NULL;
UPDATE `fc_anti_bl`.`clientes` SET `genero`='N' WHERE  `genero` IS NULL;
UPDATE `fc_anti_bl`.`clientes` SET `genero`='N' WHERE  `genero`='';
UPDATE `fc_anti_bl`.`clientes` SET `genero`='N' WHERE  `genero` NOT IN ('M','F');
UPDATE `fc_anti_bl`.`clientes` SET `seguro_vida`='0' WHERE `seguro_vida` IS NULL;
UPDATE `fc_anti_bl`.`clientes` SET `directivo`='0' WHERE  `directivo` IS NULL;

UPDATE `fc_anti_bl`.`clientes` SET `id_res_fiscal`='0' WHERE  `id_res_fiscal` IS NULL;
UPDATE `fc_anti_bl`.`clientes` SET `id_pais`='0' WHERE  `id_pais` IS NULL;
UPDATE `fc_anti_bl`.`clientes` SET `salario_conyuge`='0.00' WHERE `salario_conyuge` IS NULL;
UPDATE `fc_anti_bl`.`clientes` SET `salario_conyuge`='0.00' WHERE `salario_conyuge`='';
UPDATE `fc_anti_bl`.`cliente_dependientes` SET `es_beneficiario`='1' WHERE porcentaje>0;
UPDATE `fc_anti_bl`.`cliente_dependientes` SET `es_beneficiario`='0' WHERE porcentaje=0;
UPDATE `fc_anti_bl`.`cliente_referencias` SET `actividad_comercial`='0' WHERE `actividad_comercial` IS NULL;
UPDATE `fc_anti_bl`.`cliente_referencias` SET `tipo`='2' WHERE `tipo`='P';
ALTER TABLE `cliente_referencias`
	CHANGE COLUMN `tipo` `tipo` INT(11) NULL DEFAULT '0' AFTER `id_cliente`;

ALTER TABLE `cliente_info_laboral`
	CHANGE COLUMN `id_actividad_economica` `id_actividad_economica` INT(11) NULL DEFAULT '0' AFTER `profesion`;
UPDATE `fc_anti_bl`.`cliente_info_laboral` SET `id_actividad_economica`='0' WHERE Gen_Is_Number(`id_actividad_economica`)=0;
ALTER TABLE `cliente_info_laboral`
	CHANGE COLUMN `empresa_actividad_economica` `empresa_actividad_economica` INT(11) NULL DEFAULT '0' AFTER `email_empresa`;
ALTER TABLE `cliente_info_laboral`
	CHANGE COLUMN `id_tipo_planilla` `id_tipo_planilla` INT(11) NULL DEFAULT '0' AFTER `digito_verificador`,
	CHANGE COLUMN `id_estado_laboral` `id_estado_laboral` INT(11) NULL DEFAULT '0' AFTER `seccion`;
