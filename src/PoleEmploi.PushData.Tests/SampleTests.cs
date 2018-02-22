using NUnit.Framework;

namespace BasicProject.Tests
{
    [TestFixture]
    public class SampleTests
    {
        [TestCase(1, 2, 3, true)]
        [TestCase(1, 2, 4, false)]
        [Test]
        public void ShouldMakeAddition(int baseNumber, int numberToAdditionate, int result, bool isOk)
        {
            int additionResult = baseNumber + numberToAdditionate;
            Assert.AreEqual(additionResult == result, isOk);
        }

        [TestCaseSource(typeof(TestClassData), nameof(TestClassData.ShouldReturnTestObjectValueMultiplicateByTwo))]
        [Test]
        public void ShouldReturnTestObjectValueMultiplicateByTwo(TestObject testObject, int result, bool expected)
        {
            int testResult = testObject?.Value * 2 ?? 0;
            Assert.AreEqual(testResult == result, expected);
        }
    }
}
