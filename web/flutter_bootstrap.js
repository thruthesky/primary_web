{{flutter_js}}
{{flutter_build_config}}


const loadingMessage = document.querySelector('#loading-message');
loadingMessage.textContent = "자원을 다운로드 중입니다.";
console.log("-> 로딩 시작");
_flutter.loader.load({
    onEntrypointLoaded: async function (engineInitializer) {
        
        console.log("-> 엔진 준비 완료. 초기화 시작 함.");
    loadingMessage.textContent = "엔진을 초기화 합니다.";
    const appRunner = await engineInitializer.initializeEngine();

        console.log("-> app runner 객체 생성 완료. 앱 실행 시작 함.");
    loadingMessage.textContent = "앱을 시작합니다.";
        
            console.log("-> 이제, 실제, 앱 실행 시작 함.");
           await appRunner.runApp();
  }
});
