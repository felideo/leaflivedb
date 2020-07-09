<div class="row-fluid">
    <div class="span12">
        <form method="post"
            <?php if(isset($this->cadastro)) : ?>
                action="<?php echo URL . $this->modulo['modulo']; ?>/update/<?php echo $this->cadastro['id']; ?>"
            <?php else : ?>
                action="<?php echo URL . $this->modulo['modulo']; ?>/create"
            <?php endif ?>
        >

            <div class="row-fluid">
                <div class="form-group span6">
                    <label>Modulo</label>
                    <input class="form-control" name="<?php echo $this->modulo['modulo']; ?>[modulo]" value="<?php if(isset($this->cadastro)){echo $this->cadastro['modulo'];} ?>" required>
                </div>
                <div class="form-group span6">
                    <label>Nome de Exibição</label>
                    <input class="form-control" name="<?php echo $this->modulo['modulo']; ?>[nome]" value="<?php if(isset($this->cadastro)){echo $this->cadastro['nome'];} ?>" required>
                </div>
            </div>
            <div class="row-fluid">
                <div class="form-group span4">
                    <label>Hierarquia</label>
                    <input class="form-control" name="<?php echo $this->modulo['modulo']; ?>[hierarquia]" value="<?php if(isset($this->cadastro)){echo $this->cadastro['hierarquia'];} ?>" required>
                </div>
                <div class="form-group span8">
                    <label>Icone</label>
                    <input class="form-control" name="<?php echo $this->modulo['modulo']; ?>[icone]" value="<?php if(isset($this->cadastro)){echo $this->cadastro['icone'];} ?>" required>
                </div>
            </div>
            <div class="row-fluid">
                <div class="form-group span12">
                    <button type="submit" class="btn btn-success" style="float: right;">
                        <?php if(isset($this->cadastro)) : ?>
                            Editar <?php echo $this->modulo['send']; ?>
                        <?php else : ?>
                            Cadastrar Novo <?php echo $this->modulo['send']; ?>
                        <?php endif?>
                    </button>

                    <button type="button" class="btn btn btn-danger voltar" style="float: right;margin-right: 10px; <?php if(!isset($this->cadastro)){ echo 'display: none;';} ?>">
                        <?php if(isset($this->cadastro)) : ?>
                            Cancelar
                        <?php else : ?>
                            Voltar
                        <?php endif?>
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>