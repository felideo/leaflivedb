<?php
namespace Controllers;

use Libs;

class Senha extends \Libs\Controller {

	function __construct() {
		parent::__construct();
	}

	function index(){
	}

	public function recuperar_senha(){
		$email = carregar_variavel('email');

		$model_usuario = $this->load_external_model('usuario');
		$usuario = $model_usuario->load_user_by_email($email);

		if(isset($usuario[0]) && !empty($usuario[0])){
			$hash =  \Util\Hash::get_unic_hash();
			$retorno_hash = $model_usuario->update('usuario', $usuario[0]['id'], ['token' => $hash]);
			$retorno_hash = $model_usuario->update('usuario', $usuario[0]['id'], ['senha' => md5($hash)]);
		} else {
			$this->view->alert_js('Email não encontrado...', 'erro');
			echo json_encode(false);
			exit;
		}

		if(isset($retorno_hash['status']) && $retorno_hash['status'] == 1){
			$send_email = new \Libs\Mail();

			$mensagem = "Link para recuperação de senha:\n"
				. "<br><br><br>\n"
				. "<a href='" . URL . "senha/redefinir_senha/" . $hash . "'>\n"
				. "Redefinir Senha NeuroSis\n"
				. "</a>\n";

			$send_email->set_from('felideo@gmail.com')
				->set_to($usuario[0]['email'])
				->set_assunto('LeafLiveDB - Recuperação de Senha')
				->set_cco('felideo@gmail.com')
				->set_mensagem($mensagem);

			$retorno_email = $send_email->send_mail();
		}



		debug2($retorno_email);
		exit;

		if($retorno_email){
			$this->view->alert_js('Email de enviado com sucesso!!!', 'sucesso');
			echo json_encode(true);

		} else {
			$this->view->alert_js('Ocorreu um erro ao enviar o email, por favor tente novamente...', 'erro');
			echo json_encode(false);
		}

		exit;
	}

	public function redefinir_senha($token){
		$usuario_model = $this->load_external_model('usuario');
		$token_verdadeiro = $usuario_model->check_token($token[0]);

		if(!isset($token_verdadeiro[0])){
			$this->view->alert_js('Token de redefinição de senha inválido!!!', 'erro');
			header('location: ' . URL . 'login');
		}else{
			$this->view->token = $token[0];
			$this->view->clean_render('/senha/redefinir_senha');
		}
	}

	public function update($token){
		$nova_senha = carregar_variavel('senha');

		$model_usuario = $this->load_external_model('usuario');
		$token_verdadeiro = $model_usuario->check_token($token[0]);

		$retorno_senha = $model_usuario->update('usuario', $token_verdadeiro[0]['id'], ['senha' => $nova_senha, 'token' => '']);

		if($retorno_senha['status']){
			$this->view->alert_js('Senha alterada com sucesso!!!', 'sucesso');
		} else {
			$this->view->alert_js('Ocorreu um erro ao efetuar a alteração da senha, por favor tente novamente...', 'erro');
		}

		unset($_POST['senha']);

		$_POST['email'] = $token_verdadeiro[0]['email'];
		$_POST['senha'] = $nova_senha;

		header('location: ' . URL . 'login');
	}
}