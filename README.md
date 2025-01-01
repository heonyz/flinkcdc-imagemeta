## [1] FlinkCDC 기본 튜토리얼을 활용한 데이터레이크 구축
![image](https://github.com/user-attachments/assets/fbcaff9a-a7c6-45f6-a6b3-16b1eb3a50a7)
https://nightlies.apache.org/flink/flink-cdc-docs-master/docs/connectors/flink-sources/tutorials/build-real-time-data-lake-tutorial/

아래 프로젝트는 위의 튜토리얼을 활용하여 진행되었습니다.

![내 프로젝트](https://github.com/user-attachments/assets/008efea8-08b7-41e1-8dd9-09adee8de0cb)

### 프로젝트 개요
이 프로젝트는 위 그림에 [1]에 해당하는 프로세스입니다. 샤딩된 MySQL 환경에서 이미지 검사 및 분석에 필요한 메타데이터를 실시간으로 통합하고 관리하는 목적으로 설계되었습니다. 각 샤드(e.g., DB_1, DB_2, DB_3)는 동일한 스키마를 가지고 있으며, 분산된 데이터를 통합하여 컴퓨터 비전(CV) 모델 학습 및 분석에 활용하기 위한 데이터 파이프라인을 구현을 목표로 진행했습니다.
#### 주요 기능
- 샤딩된 MySQL 테이블을 Flink CDC를 통해 실시간으로 통합.
- Snapshot + Binlog 방식을 사용하여 초기 적재부터 이후 변경까지 모든 이력을 반영.


### 아키텍처
1. 데이터 소스: 동일한 스키마를 가진 다수의 샤딩된 MySQL 데이터베이스(DB_1, DB_2, DB_3 등).
2. 데이터 통합:
   - Flink CDC: MySQL의 binlog 이벤트(Insert, Update, Delete)를 실시간으로 캡처.
   - Snapshot 처리: 초기 데이터 상태를 병렬로 수집.
   - 증분 처리: Snapshot 이후 발생하는 변경분을 binlog로 실시간 추적.
3. 데이터 레이크: 통합된 데이터를 Apache Iceberg에 저장하여 스키마 진화 및 고성능 쿼리 지원.(학습 중)

### 프로젝트 목적
CV 학습용 데이터 통합: 샤딩된 DB의 메타데이터(이미지 경로, 검사 시점, 결함 정보 등)를 단일 데이터 세트로 통합.

실시간 데이터 처리: MySQL 데이터베이스 변경 사항을 실시간 반영.


### 데이터 베이스 스키마
![image-meta 스키마](https://github.com/user-attachments/assets/3a950982-04f9-4d5b-885f-05301e69c5f7)
