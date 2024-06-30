<script>
    import Sinba from "$lib/images/Sinba.jpg";
    import ColombiaAval from "$lib/images/ColombiaAval.png";
    import Reciclaje from "$lib/images/ Reciclaje.jpg";
</script>

<div class="wrap">
    <div class="box">
        <div class="box-top">
            <img
                class="box-image"
                src={Sinba}
                alt="Aval sobre la fundación sinba"
            />
            <div class="title-flex">
                <h3 class="box-title">Sinba.icp</h3>
                <p class="user-follow-info">Lima, Peru</p>
            </div>
            <p class="description">
                Este aval de 500 ICP está destinado a fortalecer la gestión de
                alimentos en Sinba, un proyecto innovador enfocado en la
                reducción de desperdicios y la promoción de prácticas
                sostenibles en la cadena alimentaria.
            </p>
        </div>
        <a href="/proyecto" class="button">Ver proyecto</a>
    </div>
    <div class="box">
        <div class="box-top">
            <img
                class="box-image"
                src={ColombiaAval}
                alt="Aval Sobre el país Colombia con un hermosa Vista"
            />
            <div class="title-flex">
                <h3 class="box-title">Lupita.icp</h3>
                <p class="user-follow-info">Medellin, Colombia</p>
            </div>
            <p class="description">
                Este aval de 250 ICP está destinado a impulsar un innovador
                proyecto de agricultura sostenible. El proyecto se enfoca en
                implementar prácticas agrícolas que protejan el medio ambiente,
                conserven los recursos naturales y mejoren la calidad de vida de
                los agricultores y la comunidad en general.
            </p>
        </div>
        <a href="#home" class="button">Ver proyecto</a>
    </div>
    <div class="box">
        <div class="box-top">
            <img
                class="box-image"
                src={Reciclaje}
                alt="Aval sobre el tema de reciclaje"
            />
            <div class="title-flex">
                <h3 class="box-title">rae.icp</h3>
                <p class="user-follow-info">Ciudad de mexico, Mexico</p>
            </div>
            <p class="description">
                Este aval de 100 ICP está destinado a apoyar un innovador
                proyecto de reciclaje. El objetivo del proyecto es fomentar la
                sostenibilidad y la gestión responsable de residuos mediante la
                implementación de tecnologías avanzadas y prácticas eficientes
                de reciclaje.
            </p>
        </div>
        <a href="#home" class="button">Ver proyecto</a>
    </div>
</div>

<style>
    * {
        box-sizing: border-box;
        padding: 0;
        margin: 0;
    }

    :root {
        --purple: hsl(240, 80%, 89%);
        --pink: hsl(0, 59%, 94%);
        --light-bg: hsl(204, 37%, 92%);
        --light-gray-bg: hsl(0, 0%, 94%);
        --white: hsl(0, 0%, 100%);
        --dark: hsl(0, 0%, 7%);
        --text-gray: hsl(0, 0%, 30%);
    }

    body {
        background: var(--light-bg);
        font-family: "Space Grotesk", sans-serif;
        color: var(--dark);
    }

    h3 {
        font-size: 1.5em;
        font-weight: 700;
    }

    p {
        font-size: 1em;
        line-height: 1.7;
        font-weight: 300;
        color: var(--text-gray);
    }

    .description {
        white-space: wrap;
    }

    a {
        text-decoration: none;
        color: inherit;
    }

    .wrap {
        display: flex;
        justify-content: space-between;
        align-items: stretch;
        width: 100%;
        gap: 24px;
        padding: 24px;
        flex-wrap: wrap;
    }

    .box {
        display: flex;
        flex-direction: column;
        flex-basis: 100%;
        position: relative;
        padding: 24px;
        background: #fff;
    }

    .box-top {
        display: flex;
        flex-direction: column;
        position: relative;
        gap: 12px;
        margin-bottom: 36px;
    }

    .box-image {
        width: 100%;
        height: 360px;
        object-fit: cover;
        object-position: 50% 20%;
    }

    .title-flex {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .box-title {
        border-left: 3px solid var(--purple);
        padding-left: 12px;
    }

    .user-follow-info {
        color: hsl(0, 0%, 60%);
    }

    .button {
        display: block;
        justify-content: center;
        align-items: center;
        text-align: center;
        margin-top: auto;
        padding: 16px;
        color: #000;
        background: transparent;
        box-shadow: 0px 0px 0px 1px black inset;
        transition: background 0.4s ease;
    }

    .button:hover {
        background: var(--purple);
    }

    .fill-one {
        background: var(--light-bg);
    }

    .fill-two {
        background: var(--pink);
    }

    /* RESPONSIVE QUERIES */

    @media (min-width: 320px) {
        .title-flex {
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            align-items: start;
        }
        .user-follow-info {
            margin-top: 6px;
        }
    }

    @media (min-width: 460px) {
        .title-flex {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            align-items: start;
        }
        .user-follow-info {
            margin-top: 6px;
        }
    }

    @media (min-width: 640px) {
        .box {
            flex-basis: calc(50% - 12px);
        }
        .title-flex {
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            align-items: start;
        }
        .user-follow-info {
            margin-top: 6px;
        }
    }

    @media (min-width: 840px) {
        .title-flex {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            align-items: start;
        }
        .user-follow-info {
            margin-top: 6px;
        }
    }

    @media (min-width: 1024px) {
        .box {
            flex-basis: calc(33.3% - 16px);
        }
        .title-flex {
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            align-items: start;
        }
        .user-follow-info {
            margin-top: 6px;
        }
    }

    @media (min-width: 1100px) {
        .box {
            flex-basis: calc(25% - 18px);
        }
    }
</style>
