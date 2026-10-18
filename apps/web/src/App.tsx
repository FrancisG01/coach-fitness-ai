import { brand } from "@coach/brand";

// Página provisional de la Fase S. Las pantallas reales esperan sus mockups (Fase 0.5).
export default function App() {
  return (
    <main>
      <h1>hola, soy {brand.shortName}</h1>
      <p>{brand.name} está en marcha.</p>
    </main>
  );
}
