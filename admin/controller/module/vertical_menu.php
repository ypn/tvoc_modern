<?php 
	class ControllerModuleVerticalMenu extends Controller{
		private $error=array();
		public function index()
		{
			$this->load->language('module/vertical_menu');
			$this->document->setTitle($this->language->get('heading_title'));
			$this->load->model('extension/module');		
			$this->load->model('extension/featuredex')	;
			//$this->document->addScript('view/javascript/ckeditor/ckeditor.js');
			$result=$this->model_extension_featuredex->getAllCategories();
			$arr_cate_id=array();
			foreach ($result as $rs) {
				array_push($arr_cate_id, $rs['category_id']);
			}
			if(($this->request->server['REQUEST_METHOD']=='POST')&&$this->validate()){
				if(!isset($this->request->get['module_id'])){
					$this->model_extension_module->addModule('vertical_menu',$this->request->post);
				}
				else{

					$this->model_extension_module->editModule($this->request->get['module_id'],$this->request->post);
				}

				$this->session->data['success'] = $this->language->get('text_success');
				$this->response->redirect($this->url->link('extension/module','token=' . $this->session->data['token'],'SSL'));
			}		

			$data['text_enabled']=$this->language->get('text_enabled');
			$data['text_disabled']=$this->language->get('text_disabled');
			$data['entry_status']=$this->language->get('entry_status');
			$data['button_cancel']=$this->language->get('button_cancel');
			$data['button_save']=$this->language->get('button_save');			
			$data ['entry_name']=$this->language->get('entry_name');

			$data['heading_title']=$this->language->get('heading_title');
			$data['text_edit']=$this->language->get('text_edit');
			$data['categories']=$result;			

		if(isset($this->error['warning'])){
				$data['error_warning']=$this->error['warning'];
			}
			else{$data['error_warning']='';}

		$data['breadcrumbs'] = array();

			$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
			);

			$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
			);		

			if (!isset($this->request->get['module_id'])) {

				$data['breadcrumbs'][] = array(

					'text' => $this->language->get('heading_title'),
					'href' => $this->url->link('module/vertical_menu', 'token=' . $this->session->data['token'], 'SSL')
				);
				} else {
				$data['breadcrumbs'][] = array(
					'text' => $this->language->get('heading_title'),
					'href' => $this->url->link('module/vertical_menu', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL')
				);
			}			

			if (isset($this->error['name'])) {
				$data['error_name'] = $this->error['name'];
			} else {
				$data['error_name'] = '';
			}
			
			if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('module/vertical_menu', 'token=' . $this->session->data['token'], 'SSL');
			} else {
				$data['action'] = $this->url->link('module/vertical_menu', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
			}

			$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

			if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
				$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
			}	

			$data['token'] = $this->session->data['token'];

			if (isset($this->request->post['name'])) {
				$data['name'] = $this->request->post['name'];
			} elseif (!empty($module_info)) {
				$data['name'] = $module_info['name'];
			} else {
				$data['name'] = '';
			}


			$this->load->model('tool/image');

			if ($this->request->server['HTTPS']) {
				$server = HTTPS_CATALOG .'image/' ;
			} else {
				$server = HTTP_CATALOG .'image/';
			}		

			if(isset($this->request->post['category'])){
				$cate_conf=$this->request->post['category'];				
				$data['cate_conf']=array();
				foreach ($cate_conf as $key=>$cf) {
					if(isset($cf['image'])&&is_file(DIR_IMAGE . $cf['image'])){
						$thumb = $this->model_tool_image->resize($cf['image'],50,50);
					}
					else{
						$thumb	=	$this->model_tool_image->resize('no_image.png',50,50);
					}
					$data['cate_conf'][$key]=array(
						'icon_path'	=>	$server.$cf['icon'],
						'icon'		=>	$cf['icon'],
						'thumb'		=>	$thumb,
						'image'		=>	$cf['image'],
						'img_width'	=>	$cf['img_width'],
						'img_height'=>	$cf['img_height']	
					);
				}				
				
			}

			elseif(!empty($module_info['category'])){
				$cate_conf=$module_info['category'];				
				$data['cate_conf']=array();
				foreach ($cate_conf as $key=>$cf) {
					if(isset($cf['image'])&&is_file(DIR_IMAGE . $cf['image'])){
						$thumb = $this->model_tool_image->resize($cf['image'],50,50);
					}
					else{
						$thumb	=$this->model_tool_image->resize('no_image.png',50,50);
					}					
					$data['cate_conf'][$key]=array(
						'icon_path'	=>	$server.$cf['icon'],
						'icon'		=>	$cf['icon'],
						'thumb'		=>	$thumb,
						'image'		=>	$cf['image'],
						'img_width'	=>	$cf['img_width'],
						'img_height'=>	$cf['img_height']	
					);
				}		
			}
			else
				{$data['cate_conf']=array();}
			

			if (isset($this->request->post['status'])) {
				$data['status'] = $this->request->post['status'];
			} elseif (!empty($module_info)) {
				$data['status'] = $module_info['status'];
			} else {
				$data['status'] = '';
			}			

			$data['placeholder']	=	$this->model_tool_image->resize('no_image.png',30,30);


			$data['header'] = $this->load->controller('common/header');
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['footer'] = $this->load->controller('common/footer');		
			$this->response->setOutput($this->load->view('module/vertical_menu.tpl',$data));
		}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/vertical_menu')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}		

		return !$this->error;
	
		}
	}
 ?>