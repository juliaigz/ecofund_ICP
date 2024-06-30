<script>
    import project from "$lib/images/project.png";
    import loan from "$lib/images/loan.png";
    import money from "$lib/images/money.png";
    import bussines from "$lib/images/bussines.png";
</script>

<div class="row1-container">
    <div class="box box-down cyan">
        <h2>Escoge un proyecto</h2>
        <p>
            Loggeate con tu billatera ICP y busca por categoria y encuentra un
            emprendedor a quien apoyar
        </p>
        <img
            src={project}
            alt="Escoge un proyecto"
        />
    </div>

    <div class="box red">
        <h2>Realiza un movimiento</h2>
        <p>
            Cuando los prestatarios paguen su financiamiento después del periodo
            de tiempo pactado, automáticamente se hará el reemboloso de tus ICP
        </p>
        <img
        src={loan}
            alt=""
        />
    </div>
</div>
<div class="row2-container">
    <div class="box box-down blue">
        <h2>Recibe el reembolso</h2>
        <p>
            Cuando los prestatarios paguen su financiamiento después del periodo
            de tiempo pactado, automáticamente se hará el reemboloso de tus ICP
        </p>
        <img
        src={money}
            alt=""
        />
    </div>
    <div class="box orange">
        <h2>Repetir</h2>
        <p>
            Puedes liberar tus fondos a tu billatera ICP ao volver a avalar a
            otro emprendedor, una vez que avalas a alguien ya puedes ser avalado
            en el futuro en esa nuestra tribu.
        </p>
        <img src={bussines} alt="" />
    </div>
</div>

<style>
    :root {
        /* --red: hsl(0, 78%, 62%); */
        /* --orange: hsl(34, 97%, 64%); */               
        /* --blue: hsl(212, 86%, 64%); */ 
        /* --cyan: hsl(180, 62%, 55%); */
        --red: #c39ad5;
        --cyan: #c39ad5;
        --orange: #c39ad5;
        --blue: #c39ad5;
        --varyDarkBlue: hsl(234, 12%, 34%);
        --grayishBlue: hsl(229, 6%, 66%);
        --veryLightGray: hsl(0, 0%, 98%);
        --weight1: 200;
        --weight2: 400;
        --weight3: 600;
    }

    .box {
        background-color: #59cf8c1d;
        border-radius: 40px;
        box-shadow: 0px 0px 30px -20px var(--grayishBlue);
        padding: 30px;
        margin: 20px;
    }

    img {
        float: right;
        width: 100%;
    }

    @media (max-width: 450px) {
        .box {
            height: 200px;
        }
    }

    @media (max-width: 950px) and (min-width: 450px) {
        .box {
            text-align: center;
            height: 180px;
        }
    }

    .cyan {
        border-top: 3px solid var(--cyan);
    }
    .red {
        border-top: 3px solid var(--red);
    }
    .blue {
        border-top: 3px solid var(--blue);
    }
    .orange {
        border-top: 3px solid var(--orange);
    }

    h2 {
        font-weight: var(--weight3);
    }

    @media (min-width: 950px) {
        .row1-container {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .row2-container {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .box {
            width: 20%;
        }
    }
</style>
