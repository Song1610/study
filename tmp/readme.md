# aws container 교육(에티버스) / 250211

## 모듈
1. 클라우드 네이티브 개발
2. 컨테이너가 필요한 이유
3. amazon web 
4. 

## 실습링크(~2/15까지)
[demo](https://tinyurl.com/y68sdy25)

[docker cli exersice](https://tinyurl.com/yc6sjts2)

---

마이크로 서비스 당면과제
- 개별 서비스 및 api 수와 복잡성 증가
- 아키텍처, 모니터링 및 보안 요구사항의 진화
- 조직 및 문화 차원의 변화 필요

---
# 모듈 2. 컨테이너가 필요한 이유
## 컨테이너

컨테이너 구성
- code
- dependencies
- runtime
한번 만들어진 컨테이너 이미지는 readonly

컨테이너 이점
- 이동성 : 이동식 런타임 애플리케이션 환경
- 불변성 : 변경 불가능한 단일 아티팩트
- 유연성 : 동시에 여러버전 실행
- 속도 : 개발주기 가속화
- 효율성 : 리소스 사용 및 효율성 향상

업데이트 방식
bule/green
rolling : v2 배포 후 v1 삭제하는 방식

---

## docker
구성요소
- docker client
- docker host
- docker image registry

### container image layer
- 각 컨테이너마다 RW layer가 존재하며 컨테이너 내부의 file create/update/delete 내역은 모두 저장되지않음

그니까 이게 도커교육인거야 컨테이너 교육인거야
둘다 맞긴한데

docker 이미지와 컨테이너 비교
- 컨테이너 : 이미지의 실행 인스턴스
- 모든 컨테이너에는 최상위 쓰기 가능 계층이 있음

---
## 프로덕션 어쩌구
컨테이너 보안 요약
 - 공동ㅊ 책임 모델 기억
 - 항상 수직적 방어 실천
 - end to end 자동화에 투자
 - 컨테이너 이미지 보호
 - 런타임 시 컨테이너 보안

힝..
