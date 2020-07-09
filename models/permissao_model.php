<?php
namespace Models;

use Libs;

class Permissao_Model extends \Libs\Model {
	public function __construct() {
		parent::__construct();
	}

	public function load_permissions_list() {
		$select = 'SELECT permissao.*,'
			. '  modulo.id as modulo_id, modulo.nome as modulo_nome, modulo.icone as modulo_icone, modulo.modulo as modulo_modulo, modulo.hierarquia as modulo_hierarquia'
			. ' FROM permissao permissao'
			. ' LEFT JOIN modulo modulo'
			. ' ON modulo.id = permissao.id_modulo'
			. ' WHERE modulo.ativo = 1';


		$permissoes = $this->db->select($select);

		foreach ($permissoes as $indice => $permissao) {
			if(!isset($retorno[$permissao['modulo_modulo']])){
				if($_SESSION['usuario']['hierarquia'] > $permissao['modulo_hierarquia']){
					continue;
				}

				$retorno[$permissao['modulo_modulo']] = [
					'modulo' => [
						'id' => $permissao['modulo_id'],
						'modulo' => $permissao['modulo_modulo'],
						'nome' => $permissao['modulo_nome'],
						'icone' => $permissao['modulo_icone']
					]
				];
			}

			$retorno[$permissao['modulo_modulo']]['permissoes'][$permissao['permissao']] = [
				'id' => $permissao['id'],
	            'permissao' => $permissao['permissao'],
	            'nome'	=> str_replace('_', ' ', str_replace($permissao['modulo_modulo'] . '_', '', $permissao['permissao']))
			];
		}

		return $retorno;

	}

}


